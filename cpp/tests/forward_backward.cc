#include <catch.hpp>
#include <random>

#include <Eigen/Dense>

#include "sopt/forward_backward.h"
#include "sopt/proximal.h"
#include "sopt/relative_variation.h"
#include "sopt/types.h"

sopt::t_int random_integer(sopt::t_int min, sopt::t_int max) {
  extern std::unique_ptr<std::mt19937_64> mersenne;
  std::uniform_int_distribution<sopt::t_int> uniform_dist(min, max);
  return uniform_dist(*mersenne);
};

typedef sopt::t_real Scalar;
typedef sopt::Vector<Scalar> t_Vector;
typedef sopt::Matrix<Scalar> t_Matrix;

auto const N = 4;

TEST_CASE("Forward-Backward for ||x - x0||_2 + ||x - x_1||_2^2", "[sdmm]") {
  using namespace sopt;

  t_Matrix const Id = t_Matrix::Identity(N, N).eval();
  t_Vector const target0 = t_Vector::Random(N);
  t_Vector const target1 = t_Vector::Random(N) * 4;

  auto const objective = [target0, target1](t_Vector const &x) -> Scalar {
    return (x - target0).stableNorm() + (x - target1).squaredNorm();
  };
  auto const gradient = [target1](t_Vector &out, t_Vector const &in) { out = 2 * (in - target1); };
  auto const proximal = proximal::translate(proximal::EuclidianNorm(), -target0);
  auto fb = algorithm::ForwardBackward<Scalar>(proximal, gradient)
                .itermax(1000)
                .gamma(1e-2)
                .is_converged(RelativeFunctorVariation<Scalar, Scalar>(objective, 1e-12));

  // starts from random vector of N items
  auto const result = fb(N);
  REQUIRE(result.good);
  CHECK(result.niters < fb.itermax());
  for(int i(0); i < N; ++i) {
    t_Vector epsilon = t_Vector::Zero(N);
    epsilon(i) = 1e-4;
    CAPTURE(epsilon.transpose());
    CHECK(objective(result.x) <= objective(result.x + epsilon));
    CHECK(objective(result.x) <= objective(result.x - epsilon));
  }
}
