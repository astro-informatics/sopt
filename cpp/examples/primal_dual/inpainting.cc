#include <algorithm>
#include <exception>
#include <functional>
#include <iostream>
#include <random>
#include <vector>
#include <Eigen/Eigenvalues>

#include <sopt/primal_dual.h>
#include <sopt/logging.h>
#include <sopt/maths.h>
#include <sopt/relative_variation.h>
#include <sopt/sampling.h>
#include <sopt/types.h>
#include <sopt/utilities.h>
#include <sopt/wavelets.h>
#include <sopt/power_method.h>

// This header is not part of the installed sopt interface
// It is only present in tests
#include <tools_for_tests/directories.h>
#include <tools_for_tests/tiffwrappers.h>

// \min_{x} ||\Psi^Tx||_1 \quad \mbox{s.t.} \quad ||y - Ax||_2 < \epsilon and x \geq 0
int main(int argc, char const **argv) {
  // Some typedefs for simplicity
  typedef double Scalar;
  // Column vector - linear algebra - A * x is a matrix-vector multiplication
  // type expected by PrimalDual
  typedef sopt::Vector<Scalar> Vector;

  typedef sopt::Vector<sopt::t_complex> Complex;
  // Matrix - linear algebra - A * x is a matrix-vector multiplication
  // type expected by PrimalDual
  typedef sopt::Matrix<Scalar> Matrix;
  // Image - 2D array - A * x is a coefficient-wise multiplication
  // Type expected by wavelets and image write/read functions
  typedef sopt::Image<Scalar> Image;

  
  std::string const input = argc >= 2 ? argv[1] : "cameraman256";
  std::string const output = argc == 3 ? argv[2] : "none";
  if(argc > 3) {
    std::cout << "Usage:\n"
                 "$ "
              << argv[0] << " [input [output]]\n\n"
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

  SOPT_HIGH_LOG("Read input file {}", input);
  Image const image = sopt::notinstalled::read_standard_tiff(input);

  SOPT_HIGH_LOG("Initializing sensing operator");
  sopt::t_uint nmeasure = 0.33 * image.size();
  auto const sampling
      = sopt::linear_transform<Scalar>(sopt::Sampling(image.size(), nmeasure, mersenne));

  SOPT_HIGH_LOG("Initializing wavelets");
  auto const wavelet = sopt::wavelets::factory("DB4", 4);
  auto const psi = sopt::linear_transform<Scalar>(wavelet, image.rows(), image.cols());

  SOPT_HIGH_LOG("Computing primal-dual parameters");
  Vector const y0 = sampling * Vector::Map(image.data(), image.size());
  auto const snr = 30.0;
  auto const sigma = y0.stableNorm() / std::sqrt(y0.size()) * std::pow(10.0, -(snr / 20.0));
  auto const epsilon = std::sqrt(nmeasure + 2 * std::sqrt(y0.size())) * sigma;

  SOPT_HIGH_LOG("Create dirty vector");
  std::normal_distribution<> gaussian_dist(0, sigma);
  Vector y(y0.size());
  for(sopt::t_int i = 0; i < y0.size(); i++)
    y(i) = y0(i) + gaussian_dist(mersenne);
  // Write dirty image to file
  if(output != "none") {
    Vector const dirty = sampling.adjoint() * y;
    sopt::utilities::write_tiff(Matrix::Map(dirty.data(), image.rows(), image.cols()),
                                "dirty_" + output + ".tiff");
  }

  //  Vector rand = Vector::Random(image.size());
  SOPT_HIGH_LOG("Setting up power method to calculate sigma values");
  Eigen::EigenSolver<Matrix> es;
  SOPT_HIGH_LOG("Setting up matrix A");

  int N=10;
  
  Matrix A = Matrix::Random(N,N);
  SOPT_HIGH_LOG("Setting up eigensolver");
  es.compute(A.adjoint() * A, true);

  auto const eigenvalues = es.eigenvalues();
  auto const eigenvectors = es.eigenvectors();
  Eigen::DenseIndex index;
  (eigenvalues.transpose() * eigenvalues).real().maxCoeff(&index);
  auto const eigenvalue = eigenvalues(index);
  auto const eigenvector = eigenvectors.col(index);
  // Create input vector close to solution
  auto const rand = eigenvector * 1e-4 + Complex::Random(N);
  auto const lt = sopt::linear_transform(A.cast<sopt::t_complex>());

  auto const pm = sopt::algorithm::PowerMethod<sopt::t_complex>().tolerance(1e-12);

  auto const tau = 0.49;
  auto const kappa = 0.0001;
  
  SOPT_HIGH_LOG("Calculating sigma1");
  auto const nu1data = pm.AtA(lt, rand);
  // auto const nu1data = pm.AtA(psi, rand);
  nu1data.eigenvector.real().maxCoeff(&index);
  auto const nu1 = nu1data.eigenvector(index).real();
  //  auto const sigma1 = 1 / nu1*nu1;
  auto const sigma1 = 1e0 / nu1*nu1;

  SOPT_HIGH_LOG("Calculating sigma2");  
  auto const nu2data = pm.AtA(lt, rand);
  //  auto const nu2data = pm.AtA(sampling, rand);
  nu2data.eigenvector.real().maxCoeff(&index);
  auto const nu2 = nu2data.eigenvector(index).real();
  auto const sigma2 = 1e0 / nu2*nu2;

  SOPT_HIGH_LOG("Setting up primal dual algorithm");
  
  SOPT_HIGH_LOG("Creating primal-dual Functor");
  auto const pd = sopt::algorithm::PrimalDual<Scalar>(y)
                         .itermax(500)
                         .tau(tau)
                         .kappa(kappa)
                         .sigma1(sigma1)
                         .sigma2(sigma2)
    // .l2ball_proximal_epsilon(epsilon)
                         .nu(nu2*nu2)
                         .Psi(psi)
                         .Phi(sampling)
                         .relative_variation(5e-4)
                         .residual_convergence(epsilon * 1.001);
		    

  SOPT_HIGH_LOG("Starting primal dual");
  // Alternatively, pd can be called with a tuple (x, residual) as argument
  // Here, we default to (Φ^Ty/ν, ΦΦ^Ty/ν - y)
  auto const diagnostic = pd();
  SOPT_HIGH_LOG("primal dual returned {}", diagnostic.good);

  // diagnostic should tell us the function converged
  // it also contains diagnostic.niters - the number of iterations, and cg_diagnostic - the
  // diagnostic from the last call to the conjugate gradient.
  if(not diagnostic.good)
    throw std::runtime_error("Did not converge!");

  SOPT_HIGH_LOG("SOPT-primal-dual converged in {} iterations", diagnostic.niters);
  if(output != "none")
    sopt::utilities::write_tiff(Matrix::Map(diagnostic.x.data(), image.rows(), image.cols()),
                                output + ".tiff");

  return 0;
}
