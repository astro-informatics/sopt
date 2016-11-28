#include <catch.hpp>
#include <random>

#include <Eigen/Dense>

#include "sopt/primal_dual.h"
#include "sopt/proximal.h"
#include "sopt/types.h"
#include "sopt/power_method.h"
#include "sopt/maths.h"

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

  t_Matrix const mId = -t_Matrix::Identity(N, N);

  auto const sigma1 = 1.0;
  auto const sigma2 = 1.0;
  
  t_Vector const translation = t_Vector::Ones(N) * 5;

  t_Vector target = t_Vector::Random(N);

  t_Vector weights = t_Vector(1);
  weights(0) = 1.0;
  
  auto const epsilon = sopt::l2_norm(target, weights)/2;
  
  
  
  auto const primaldual = algorithm::PrimalDual<Scalar>(target)
                         .Phi(mId)
                         .Psi(mId)
                         .itermax(3000)
                         .kappa(0.1)
                         .tau(0.49)
                         .l2ball_epsilon(epsilon)
                         .sigma1(sigma1)
                         .sigma2(sigma2);
  
  auto const result = primaldual();
  
  CAPTURE((result.x - target).transpose());
  CHECK((result.x - target).stableNorm() < epsilon);
  //  CHECK((result.x - target0 - alpha * segment).stableNorm() < 1e-8);
}
