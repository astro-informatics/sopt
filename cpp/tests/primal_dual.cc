#include <catch.hpp>
#include <random>

#include <Eigen/Dense>

#include "sopt/primal_dual.h"
#include "sopt/proximal.h"
#include "sopt/types.h"
#include "sopt/power_method.h"

sopt::t_int random_integer(sopt::t_int min, sopt::t_int max) {
  extern std::unique_ptr<std::mt19937_64> mersenne;
  std::uniform_int_distribution<sopt::t_int> uniform_dist(min, max);
  return uniform_dist(*mersenne);
};

typedef sopt::t_real Scalar;
typedef sopt::Vector<Scalar> t_Vector;
typedef sopt::Matrix<Scalar> t_Matrix;

auto const N = 5;

TEST_CASE("Primal Dual with ||x - x0||_2 functions", "[primaldual][integration]") {
  using namespace sopt;
  t_Vector const target0 = t_Vector::Random(N);
  t_Vector const target1 = t_Vector::Random(N) * 4;

  t_Matrix const mId = -t_Matrix::Identity(N, N);

  auto const sigma1 = 1.0;
  auto const sigma2 = 1.0;
  
  t_Vector const translation = t_Vector::Ones(N) * 5;
  auto const primaldual = algorithm::PrimalDual<Scalar>(t_Vector::Zero(N))
                         .Phi(mId)
                         .Psi(mId)
                         .itermax(3000)
                         .kappa(0.1)
                         .tau(0.49)
                         .sigma1(sigma1)
                         .sigma2(sigma2);
  
  auto const result = primaldual();

  t_Vector const segment = (target1 - target0).normalized();
  t_real const alpha = (result.x - target0).transpose() * segment;

  CHECK((target1 - target0).transpose() * segment >= alpha);
  CHECK(alpha >= 0e0);
  CAPTURE(segment.transpose());
  CAPTURE((result.x - target0).transpose());
  CAPTURE((result.x - target1).transpose());
  CHECK((result.x - target0 - alpha * segment).stableNorm() < 1e-8);
}
