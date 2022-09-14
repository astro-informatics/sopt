#include <algorithm>
#include <exception>
#include <functional>
#include <iostream>
#include <random>
#include <vector>
#include <ctime>
#include <catch.hpp>

#include <sopt/imaging_forward_backward.h>
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

typedef double Scalar;
typedef sopt::Vector<Scalar> Vector;
typedef sopt::Matrix<Scalar> Matrix;
typedef sopt::Image<Scalar> Image;

TEST_CASE("Inpainting"){
  extern std::unique_ptr<std::mt19937_64> mersenne;
  std::string const input = "cameraman256";
  std::string const output = "none";

  Image const image = sopt::notinstalled::read_standard_tiff(input);

  sopt::t_uint nmeasure = std::floor(0.5 * image.size());
  sopt::LinearTransform<Vector> const sampling =
      sopt::linear_transform<Scalar>(sopt::Sampling(image.size(), nmeasure, *mersenne));

  auto const wavelet = sopt::wavelets::factory("DB8", 4);

  auto const psi = sopt::linear_transform<Scalar>(wavelet, image.rows(), image.cols());

  Vector const y0 = sampling * Vector::Map(image.data(), image.size());
  auto const snr = 30.0;
  auto const sigma = y0.stableNorm() / std::sqrt(y0.size()) * std::pow(10.0, -(snr / 20.0));
  auto const epsilon = std::sqrt(nmeasure + 2 * std::sqrt(y0.size())) * sigma;


  std::normal_distribution<> gaussian_dist(0, sigma);
  Vector y(y0.size());
  for (sopt::t_int i = 0; i < y0.size(); i++) y(i) = y0(i) + gaussian_dist(*mersenne);
  // Write dirty imagte to file
  if (output != "none") {
    Vector const dirty = sampling.adjoint() * y;
    sopt::utilities::write_tiff(Matrix::Map(dirty.data(), image.rows(), image.cols()),
                                "dirty_" + output + ".tiff");
  }

  sopt::t_real const gamma = 18;
  sopt::t_real const beta = sigma * sigma * 0.5;

  auto const fb = sopt::algorithm::ImagingForwardBackward<Scalar>(y)
                      .itermax(500)
                      .beta(beta)    // stepsize
                      .sigma(sigma)  // sigma
                      .gamma(gamma)  // regularisation paramater
                      .relative_variation(1e-3)
                      .residual_tolerance(0)
                      .tight_frame(true)
                      .l1_proximal_tolerance(1e-4)
                      .l1_proximal_nu(1)
                      .l1_proximal_itermax(50)
                      .l1_proximal_positivity_constraint(true)
                      .l1_proximal_real_constraint(true)
                      .Psi(psi)
                      .Phi(sampling);

  auto const diagnostic = fb();

  // compare input image to cleaned output image
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 ) 
  // check this is less than the number of pixels * 0.01

  auto mse = (image - diagnostic.x.array()).square().sum() / image.size();
  CAPTURE(mse);
  CHECK(mse < 0.01);

  if (output != "none")
    sopt::utilities::write_tiff(Matrix::Map(diagnostic.x.data(), image.rows(), image.cols()),
                                output + ".tiff");
  // diagnostic should tell us the function converged
  // it also contains diagnostic.niters - the number of iterations, and cg_diagnostic - the
  // diagnostic from the last call to the conjugate gradient.
  if (not diagnostic.good) throw std::runtime_error("Did not converge!");
}