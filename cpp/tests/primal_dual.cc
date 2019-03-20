#include <catch.hpp>
#include <random>

#include <assert.h>

#include <Eigen/Dense>

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

TEST_CASE("Primal Dual, testing norm(output - target()) < l2ball_epsilon()",
          "[primaldual][integration]") {
  using namespace sopt;

  t_Matrix const mId = t_Matrix::Identity(N, N);

  t_Vector target = t_Vector::Random(N);

  target = sopt::positive_quadrant(target);

  auto const epsilon = target.stableNorm() / 2;

  auto const primaldual = algorithm::PrimalDual<Scalar>(target)
                              .Phi(mId)
                              .Psi(mId)
                              .itermax(5000)
                              .kappa(0.1)
                              .tau(0.49)
                              .l2ball_epsilon(epsilon)
                              .relative_variation(1e-4)
                              .residual_convergence(epsilon);

  auto const result = primaldual();

  CHECK((result.x - target).stableNorm() <= epsilon);
}

TEST_CASE("Primal Dual, testing norm(output - target()) < l2ball_epsilon() no positive quadrant",
          "[primaldual][integration]") {
  using namespace sopt;

  t_Matrix const mId = t_Matrix::Identity(N, N);

  t_Vector target = t_Vector::Random(N);

  auto const epsilon = target.stableNorm() / 2;

  auto const primaldual = algorithm::PrimalDual<Scalar>(target)
                              .Phi(mId)
                              .Psi(mId)
                              .itermax(5000)
                              .kappa(0.1)
                              .tau(0.49)
                              .l2ball_epsilon(epsilon)
                              .positivity_constraint(false)
                              .relative_variation(1e-4)
                              .residual_convergence(epsilon);

  auto const result = primaldual();

  CHECK((result.x - target).stableNorm() <= epsilon);
}

TEST_CASE(
    "Primal Dual, testing norm(output - target()) < l2ball_epsilon() where target vector is "
    "mainly zero",
    "[primaldual][integration]") {
  using namespace sopt;

  t_Matrix const mId = t_Matrix::Identity(N, N);

  t_Vector target = t_Vector::Zero(N);

  target(1) = random_integer(1, 10);

  auto const epsilon = target.stableNorm() / 2;

  auto const primaldual = algorithm::PrimalDual<Scalar>(target)
                              .Phi(mId)
                              .Psi(mId)
                              .itermax(5000)
                              .kappa(0.1)
                              .tau(0.49)
                              .l2ball_epsilon(epsilon)
                              .relative_variation(1e-4)
                              .residual_convergence(epsilon);

  auto const result = primaldual();

  CHECK((result.x - target).stableNorm() <= epsilon);
  // Check that the elements of the solution are zero where the elements of the target vector are
  // zero.
  for (t_uint i = 0; i < N; ++i) {
    if (target(i) == 0) {
      CHECK(result.x(i) == Approx(0));
    } else {
      CHECK(result.x(i) != Approx(0));
    }
  }
}

template <class T>
struct is_primal_dual_ref : public std::is_same<sopt::algorithm::PrimalDual<double> &, T> {};
TEST_CASE("Check type returned on setting variables") {
  // Yeah, could be static asserts
  using namespace sopt;
  using namespace sopt::algorithm;
  PrimalDual<double> pd(Vector<double>::Zero(0));
  CHECK(is_primal_dual_ref<decltype(pd.itermax(500))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.kappa(1))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.relative_variation(5e-4))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.l2ball_epsilon(1e-4))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.residual_convergence(1.001))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.nu(1e0))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.sigma1(1e0))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.sigma2(1e0))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.levels(1))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.positivity_constraint(true))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.l1_proximal_weights(Vector<double>::Zero(0)))>::value);

  typedef ConvergenceFunction<double> ConvFunc;
  CHECK(is_primal_dual_ref<decltype(pd.is_converged(std::declval<ConvFunc>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.is_converged(std::declval<ConvFunc &>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.is_converged(std::declval<ConvFunc &&>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.is_converged(std::declval<ConvFunc const &>()))>::value);

  typedef LinearTransform<Vector<double>> LinTrans;
  CHECK(is_primal_dual_ref<decltype(pd.Phi(linear_transform_identity<double>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.Phi(std::declval<LinTrans>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.Phi(std::declval<LinTrans &&>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.Phi(std::declval<LinTrans &>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.Phi(std::declval<LinTrans const &>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.Psi(linear_transform_identity<double>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.Psi(std::declval<LinTrans>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.Psi(std::declval<LinTrans &&>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.Psi(std::declval<LinTrans &>()))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.Psi(std::declval<LinTrans const &>()))>::value);
}
