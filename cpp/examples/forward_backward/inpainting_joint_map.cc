#include <algorithm>
#include <exception>
#include <functional>
#include <iostream>
#include <random>
#include <vector>

#include <sopt/imaging_forward_backward.h>
#include <sopt/joint_map.h>
#include <sopt/logging.h>
#include <sopt/maths.h>
#include <sopt/relative_variation.h>
#include <sopt/sampling.h>
#include <sopt/types.h>
#include <sopt/utilities.h>
#include <sopt/wavelets.h>
// This header is not part of the installed sopt interface
// It is only present in tests
#include <tools_for_tests/directories.h>
#include <tools_for_tests/tiffwrappers.h>

// \min_{x} ||\Psi^Tx||_1 \quad \mbox{s.t.} \quad ||y - Ax||_2 < \epsilon and x \geq 0
int main(int argc, char const **argv) {
  // Some typedefs for simplicity
  typedef double Scalar;
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
  Image const image = sopt::notinstalled::read_standard_tiff(input);
  SOPT_HIGH_LOG("Image size: {} x {} = {}", image.cols(), image.rows(), image.size());

  SOPT_HIGH_LOG("Initializing sensing operator");
  sopt::t_uint nmeasure = std::floor(0.5 * image.size());
  sopt::LinearTransform<Vector> const sampling =
      sopt::linear_transform<Scalar>(sopt::Sampling(image.size(), nmeasure, mersenne));
  SOPT_HIGH_LOG("Initializing wavelets");
  auto const wavelet = sopt::wavelets::factory("DB8", 4);

  // sopt::wavelets::SARA const wavelet{std::make_tuple("db1", 4u), std::make_tuple("db2", 4u),
  //                                     std::make_tuple("db3", 4u), std::make_tuple("db4", 4u)};

  auto const psi = sopt::linear_transform<Scalar>(wavelet, image.rows(), image.cols());
  SOPT_LOW_LOG("Wavelet coefficients: {}", (psi.adjoint() * image).size());

  SOPT_HIGH_LOG("Computing Forward Backward parameters");
  Vector const y0 = sampling * Vector::Map(image.data(), image.size());
  auto const snr = 30.0;
  auto const sigma = y0.stableNorm() / std::sqrt(y0.size()) * std::pow(10.0, -(snr / 20.0));
  auto const epsilon = std::sqrt(nmeasure + 2 * std::sqrt(y0.size())) * sigma;

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
  auto const fb = std::make_shared<sopt::algorithm::ImagingForwardBackward<Scalar>>(y);
  fb->itermax(50000)
      .beta(beta)    // stepsize
      .sigma(sigma)  // sigma
      .gamma(gamma)  // regularisation paramater
      .relative_variation(1e-3)
      .residual_tolerance(0)
      .tight_frame(false)
      .l1_proximal_tolerance(1e-5)
      .l1_proximal_nu(1)
      .l1_proximal_itermax(50)
      .l1_proximal_positivity_constraint(true)
      .l1_proximal_real_constraint(true)
      .Psi(psi)
      .Phi(sampling);

  SOPT_HIGH_LOG("Starting Forward Backward");
  // Alternatively, forward-backward can be called with a tuple (x, residual) as argument
  // Here, we default to (y, Φx/ν - y)
  auto l1_norm = [psi](const Vector &x) { return sopt::l1_norm(psi.adjoint() * x); };
  const sopt::t_uint number_of_wavelet_coefficients = image.size();
  auto joint_map = sopt::algorithm::JointMAP<sopt::algorithm::ImagingForwardBackward<Scalar>>(
                       fb, l1_norm, number_of_wavelet_coefficients)
                       .alpha(1)
                       .beta(1)
                       .k(1)
                       .relative_variation(1e-3)
                       .objective_variation(1e-3);
  auto diagnostic = joint_map();
  SOPT_HIGH_LOG("Forward backward returned {}", diagnostic.good);
  if (output != "none")
    sopt::utilities::write_tiff(Matrix::Map(diagnostic.x.data(), image.rows(), image.cols()),
                                output + ".tiff");
  // diagnostic should tell us the function converged
  // it also contains diagnostic.niters - the number of iterations, and cg_diagnostic - the
  // diagnostic from the last call to the conjugate gradient.
  if (not diagnostic.good) throw std::runtime_error("Did not converge!");

  SOPT_HIGH_LOG("SOPT-Forward Backward converged in {} iterations", diagnostic.niters);

  return 0;
}
