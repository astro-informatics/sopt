#include <algorithm>
#include <exception>
#include <functional>
#include <iostream>
#include <random>
#include <vector>
#include <ctime>

#include "sopt/credible_region.h"
#include "sopt/imaging_forward_backward.h"
#include "sopt/l1_g_proximal.h"
#include "sopt/logging.h"
#include "sopt/maths.h"
#include "sopt/relative_variation.h"
#include "sopt/sampling.h"
#include "sopt/types.h"
#include "sopt/utilities.h"
#include "sopt/wavelets.h"
// This header is not part of the installed sopt interface
// It is only present in tests
#include "tools_for_tests/directories.h"
#include "tools_for_tests/tiffwrappers.h"

// \min_{x} ||\Psi^Tx||_1 \quad \mbox{s.t.} \quad ||y - Ax||_2 < \epsilon and x \geq 0
int main(int argc, char const **argv) {
  // Some typedefs for simplicity
  typedef sopt::t_real Scalar;
  // Column vector - linear algebra - A * x is a matrix-vector multiplication
  // type expected by Forward Backward
  typedef sopt::Vector<Scalar> Vector;
  // Matrix - linear algebra - A * x is a matrix-vector multiplication
  // type expected by Forward Backward
  typedef sopt::Matrix<Scalar> Matrix;
  // Image - 2D array - A * x is a coefficient-wise multiplication
  // Type expected by wavelets and image write/read functions
  typedef sopt::Image<Scalar> Image;

  std::string const input = argc >= 2 ? argv[1] : "cameraman256";
  std::string const output = argc == 3 ? argv[2] : "none";
  if (argc > 3) {
    std::cout << "Usage:\n"
                 "$ "
              << argv[0]
              << " [input [output]]\n\n"
                 "- input: path to the image to clean (or name of standard SOPT image)\n"
                 "- output: filename pattern for output image\n";
    exit(0);
  }
  // Set up random numbers for C and C++
  auto const seed = std::time(0);
  std::srand((unsigned int)seed);
  std::mt19937 mersenne(std::time(0));

  // Initializes and sets logger (if compiled with logging)
  // See set_level function for levels.
  sopt::logging::initialize();
  sopt::logging::set_level("debug");
  SOPT_HIGH_LOG("Read input file {}", input);
  const Image image = sopt::notinstalled::read_standard_tiff(input) /
                      sopt::notinstalled::read_standard_tiff(input).cwiseAbs().maxCoeff();
  SOPT_HIGH_LOG("Image size: {} x {} = {}", image.cols(), image.rows(), image.size());

  SOPT_HIGH_LOG("Initializing sensing operator");
  sopt::t_uint nmeasure = std::floor(0.33 * image.size());
  sopt::LinearTransform<Vector> const sampling =
      sopt::linear_transform<Scalar>(sopt::Sampling(image.size(), nmeasure, mersenne));
  SOPT_HIGH_LOG("Initializing wavelets");
  auto const wavelet = sopt::wavelets::factory("DB8", 4);

  //  sopt::wavelets::SARA const wavelet{std::make_tuple("db1", 4u), std::make_tuple("db2", 4u),
  //                                   std::make_tuple("db3", 4u), std::make_tuple("db4", 4u)};

  auto const psi = sopt::linear_transform<Scalar>(wavelet, image.rows(), image.cols());
  SOPT_LOW_LOG("Wavelet coefficients: {}", (psi.adjoint() * image).size());

  SOPT_HIGH_LOG("Computing Forward Backward parameters");
  Vector const y0 = sampling * Vector::Map(image.data(), image.size());
  auto const snr = 30.0;
  auto const sigma = y0.stableNorm() / std::sqrt(y0.size()) * std::pow(10.0, -(snr / 20.0));
  auto const epsilon = std::sqrt(nmeasure + 2 * std::sqrt(nmeasure)) * sigma;

  SOPT_HIGH_LOG("Create dirty vector");
  std::normal_distribution<> gaussian_dist(0, sigma);
  Vector y(y0.size());
  for (sopt::t_int i = 0; i < y0.size(); i++) y(i) = y0(i) + gaussian_dist(mersenne);
  // Write dirty imagte to file
  if (output != "none") {
    Vector const dirty = sampling.adjoint() * y;
    sopt::utilities::write_tiff(Matrix::Map(dirty.data(), image.rows(), image.cols()),
                                "dirty_" + output + ".tiff");
  }

  sopt::t_real const gamma = 18;
  sopt::t_real const beta = sigma * sigma;
  SOPT_HIGH_LOG("Creating Foward Backward Functor");
  auto fb = sopt::algorithm::ImagingForwardBackward<Scalar>(y)
    .itermax(500)
    .beta(beta)
    .sigma(sigma)
    .gamma(gamma)
    .relative_variation(5e-4)
    .residual_tolerance(0)
    .tight_frame(true)
    .Phi(sampling);

  // Create a shared pointer to an instance of the L1GProximal class
  // and set its properties
  auto gp = std::make_shared<sopt::algorithm::L1GProximal<Scalar>>(false);
  gp->l1_proximal_tolerance(1e-4)
    .l1_proximal_nu(1)
    .l1_proximal_itermax(50)
    .l1_proximal_positivity_constraint(true)
    .l1_proximal_real_constraint(true)
    .Psi(psi);
  
  // Once the properties are set, inject it into the ImagingForwardBackward object
  fb.g_proximal(gp);
  
  SOPT_HIGH_LOG("Starting Forward Backward");
  // Alternatively, forward-backward can be called with a tuple (x, residual) as argument
  // Here, we default to (Φ^Ty/ν, ΦΦ^Ty/ν - y)
  auto const diagnostic = fb();
  SOPT_HIGH_LOG("Forward backward returned {}", diagnostic.good);

  if (output != "none")
    sopt::utilities::write_tiff(Matrix::Map(diagnostic.x.data(), image.rows(), image.cols()),
                                output + ".tiff");
  // diagnostic should tell us the function converged
  // it also contains diagnostic.niters - the number of iterations, and cg_diagnostic - the
  // diagnostic from the last call to the conjugate gradient.
  if (not diagnostic.good) throw std::runtime_error("Did not converge!");

  SOPT_HIGH_LOG("SOPT-Forward Backward converged in {} iterations", diagnostic.niters);

  const sopt::t_real alpha = 0.99;
  const sopt::t_uint grid_pixel_size = image.rows() / 16;
  SOPT_HIGH_LOG("Finding credible interval");
  const std::function<Scalar(Vector)> objective_function = [gamma, sigma, &y, &sampling,
                                                            &psi](const Vector &x) {
    return sopt::l1_norm(psi.adjoint() * x) * gamma +
           0.5 * std::pow(sopt::l2_norm(sampling * x - y), 2) / (sigma * sigma);
  };

  sopt::Image<sopt::t_real> lower_error, upper_error, mean_solution;
  std::tie(lower_error, mean_solution, upper_error) =
      sopt::credible_region::credible_interval<sopt::Vector<sopt::t_real>, sopt::t_real>(
          diagnostic.x, image.rows(), image.cols(), grid_pixel_size, objective_function, alpha);
  if (output != "none") {
    sopt::utilities::write_tiff(
        Matrix::Map(upper_error.data(), upper_error.rows(), upper_error.cols()),
        output + "_upper_error.tiff");
    sopt::utilities::write_tiff(
        Matrix::Map(mean_solution.data(), mean_solution.rows(), mean_solution.cols()),
        output + "_mean_solution.tiff");
    sopt::utilities::write_tiff(
        Matrix::Map(lower_error.data(), lower_error.rows(), lower_error.cols()),
        output + "_lower_error.tiff");
  }
  return 0;
}
