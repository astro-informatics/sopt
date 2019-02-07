#include <catch.hpp>
#include <random>

#include <assert.h>

#include <Eigen/Dense>

#include "sopt/imaging_primal_dual.h"
#include "sopt/primal_dual.h"
#include "sopt/proximal.h"
#include "sopt/types.h"

sopt::t_int random_integer(sopt::t_int min, sopt::t_int max) {
  extern std::unique_ptr<std::mt19937_64> mersenne;
  std::uniform_int_distribution<sopt::t_int> uniform_dist(min, max);
  return uniform_dist(*mersenne);
};

typedef sopt::t_real Scalar;
typedef sopt::Vector<Scalar> t_Vector;
typedef sopt::Matrix<Scalar> t_Matrix;

auto const N = 5;

TEST_CASE("Primal Dual", "[primaldual]") {
  using namespace sopt;

  t_Matrix const mId = t_Matrix::Identity(N, N);

  t_Vector target = t_Vector::Random(N);

  target = sopt::positive_quadrant(target);

  auto const epsilon = target.stableNorm() / 2;

  auto const primaldual = algorithm::ImagingPrimalDual<Scalar>(target)
                              .Phi(mId)
                              .Psi(mId)
                              .itermax(5000)
                              .sigma(0.1)
                              .tau(0.1)
                              .beta(0.05)
                              .l2ball_proximal_epsilon(epsilon)
                              .update_scale(0.03)
                              .relative_variation(1e-4)
                              .residual_convergence(epsilon);

  auto const result = primaldual();

  CHECK((result.x - target).stableNorm() <= epsilon);
  CHECK(result.good);
}

template <class T>
struct is_primal_dual_ref : public std::is_same<sopt::algorithm::ImagingPrimalDual<double> &, T> {};
TEST_CASE("Check type returned on setting variables") {
  // Yeah, could be static asserts
  using namespace sopt;
  using namespace sopt::algorithm;
  ImagingPrimalDual<double> pd(Vector<double>::Zero(0));
  CHECK(is_primal_dual_ref<decltype(pd.itermax(500))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.sigma(1))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.tau(1))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.update_scale(1e0))>::value);
}
