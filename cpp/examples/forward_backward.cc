#include <exception>
#include <sopt/forward_backward.h>
#include <sopt/proximal.h>
#include <sopt/relative_variation.h>
#include <sopt/types.h>

// We will minimize ||x - x_0||_2 + ||x - x_1||_2^2
int main(int, char const **) {
  // Initializes and sets logger (if compiled with logging)
  // See set_level function for levels.
  sopt::logging::initialize();

  // Some typedefs for simplicity
  typedef sopt::t_real Real;
  typedef std::complex<Real> Scalar;
  typedef sopt::Vector<Scalar> Vector;
  typedef sopt::Matrix<Scalar> Matrix;

  auto const N = 4;
  Matrix const Id = Matrix::Identity(N, N).eval();
  Vector const target0 = Vector::Random(N);
  Vector const target1 = Vector::Random(N) * 4;

  // Objective function to minimize
  // Other than in convergence test, this function is not used by the FB algorithm
  auto const objective = [target0, target1](Vector const &x) -> Real {
    return (x - target0).stableNorm() + (x - target1).squaredNorm();
  };
  // gradient of the second part of the
  auto const gradient = [target1](Vector &out, Vector const &in) { out = 2 * (in - target1); };
  auto const proximal = sopt::proximal::translate(sopt::proximal::EuclidianNorm(), -target0);
  auto fb = sopt::algorithm::ForwardBackward<Scalar>(proximal, gradient)
                .itermax(1000)
                .gamma(1e-2)
                .is_converged(sopt::RelativeFunctorVariation<Scalar, Real>(objective, 1e-12));

  // starts from random vector of N items
  auto const result = fb(N);
  if(not result.good)
    throw std::runtime_error("Algorithm did not converge");
  for(int i(0); i < N; ++i) {
    Vector epsilon = Vector::Zero(N);
    epsilon(i) = 1e-4;
    SOPT_HIGH_LOG("Checking solution is a minimum in direction {}\n"
                  "  +: {:18.12f} ≤? {:<18.12f}\n"
                  "  -: {:18.12f} ≤? {:<18.12f}",
                  i, objective(result.x), objective(result.x + epsilon), objective(result.x),
                  objective(result.x - epsilon));
    if(objective(result.x) > objective(result.x + epsilon))
      throw std::runtime_error("Not a minimum");
    if(objective(result.x) > objective(result.x - epsilon))
      throw std::runtime_error("Not a minimum");
  }
  return 0;
}
