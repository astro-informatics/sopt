#include <algorithm>
#include <exception>
#include <functional>
#include <iostream>
#include <random>
#include <vector>
#include <ctime>

#include "sopt/logging.h"
#include "sopt/maths.h"
#include "sopt/relative_variation.h"
#include "sopt/sampling.h"
#include "sopt/sdmm.h"
#include "sopt/types.h"
#include "sopt/utilities.h"
#include "sopt/wavelets.h"
// This header is not part of the installed sopt interface
// It is only present in tests
#include "tools_for_tests/directories.h"
#include "tools_for_tests/tiffwrappers.h"

// \min_{x} ||\Psi^Tx||_1 \quad \mbox{s.t.} \quad ||y - Ax||_2 < \epsilon and x \geq 0
int main(int argc, char const **argv) {
  // Some type aliases for simplicity
  using Scalar = double;
  // Column vector - linear algebra - A * x is a matrix-vector multiplication
  // type expected by SDMM
  using Vector = sopt::Vector<Scalar>;
  // Matrix - linear algebra - A * x is a matrix-vector multiplication
  // type expected by SDMM
  using Matrix = sopt::Matrix<Scalar>;
  // Image - 2D array - A * x is a coefficient-wise multiplication
  // Type expected by wavelets and image write/read functions
  using Image = sopt::Image<Scalar>;

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
  auto const seed = std::time(nullptr);
  std::srand(static_cast<unsigned int>(seed));
  std::mt19937 mersenne(std::time(nullptr));

  // Initializes and sets logger (if compiled with logging)
  // See set_level function for levels.
  sopt::logging::initialize();

  SOPT_HIGH_LOG("Read input file {}", input);
  Image const image = sopt::notinstalled::read_standard_tiff(input);

  SOPT_HIGH_LOG("Initializing sensing operator");
  sopt::t_uint const nmeasure = 0.33 * image.size();
  auto const sampling =
      sopt::linear_transform<Scalar>(sopt::Sampling(image.size(), nmeasure, mersenne));

  SOPT_HIGH_LOG("Initializing wavelets");
  auto const wavelet = sopt::wavelets::factory("DB4", 4);
  auto const psi = sopt::linear_transform<Scalar>(wavelet, image.rows(), image.cols());

  SOPT_HIGH_LOG("Computing sdmm parameters");
  Vector const y0 = sampling * Vector::Map(image.data(), image.size());
  auto constexpr snr = 30.0;
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

  SOPT_HIGH_LOG("Initializing convergence function");
  auto relvar = sopt::RelativeVariation<Scalar>(5e-2);
  auto convergence = [&y, &sampling, &psi, &relvar](sopt::Vector<Scalar> const &x) -> bool {
    SOPT_MEDIUM_LOG("||x - y||_2: {}", (y - sampling * x).stableNorm());
    SOPT_MEDIUM_LOG("||Psi^Tx||_1: {}", sopt::l1_norm(psi.adjoint() * x));
    SOPT_MEDIUM_LOG("||abs(x) - x||_2: {}", (x.array().abs().matrix() - x).stableNorm());
    return relvar(x);
  };

  SOPT_HIGH_LOG("Creating SDMM Functor");
  auto const sdmm =
      sopt::algorithm::SDMM<Scalar>()
          .itermax(3000)
          .gamma(0.1)
          .conjugate_gradient(200, 1e-8)
          .is_converged(convergence)
          // Any number of (proximal g_i, L_i) pairs can be added
          // ||Psi^dagger x||_1
          .append(sopt::proximal::l1_norm<Scalar>, psi.adjoint(), psi)
          // ||y - A x|| < epsilon
          .append(sopt::proximal::translate(sopt::proximal::L2Ball<Scalar>(epsilon), -y), sampling)
          // x in positive quadrant
          .append(sopt::proximal::positive_quadrant<Scalar>);

  SOPT_HIGH_LOG("Allocating result vector");
  Vector result(image.size());
  SOPT_HIGH_LOG("Starting SDMM");
  auto const diagnostic = sdmm(result, Vector::Zero(image.size()));
  SOPT_HIGH_LOG("SDMM returned {}", diagnostic.good);

  // diagnostic should tell us the function converged
  // it also contains diagnostic.niters - the number of iterations, and cg_diagnostic - the
  // diagnostic from the last call to the conjugate gradient.
  if (not diagnostic.good) throw std::runtime_error("Did not converge!");

  SOPT_HIGH_LOG("SOPT-SDMM converged in {} iterations", diagnostic.niters);
  if (output != "none")
    sopt::utilities::write_tiff(Matrix::Map(result.data(), image.rows(), image.cols()),
                                output + ".tiff");

  return 0;
}
