#include <catch.hpp>
#include <random>

#include <assert.h>

#include <Eigen/Dense>

#include "sopt/imaging_primal_dual.h"
#include "sopt/primal_dual.h"
#include "sopt/proximal.h"
#include "sopt/types.h"

typedef sopt::t_real Scalar;
typedef sopt::Vector<Scalar> t_Vector;
typedef sopt::Matrix<Scalar> t_Matrix;

auto constexpr N = 5;

TEST_CASE("Primal Dual Imaging", "[primaldual]") {
  using namespace sopt;

  t_Matrix const mId = t_Matrix::Identity(N, N);

  t_Vector target = t_Vector::Random(N);

  target = sopt::positive_quadrant(target);

  auto const epsilon = target.stableNorm() / 2;

  auto primaldual = algorithm::ImagingPrimalDual<Scalar>(target)
                        .l1_proximal_weights(t_Vector::Ones(target.size()))
                        .Phi(mId)
                        .Psi(mId)
                        .itermax(5000)
                        .tau(0.1)
                        .gamma(0.4)
                        .l2ball_proximal_epsilon(epsilon)
                        .relative_variation(1e-4)
                        .residual_convergence(epsilon);

  auto const result = primaldual();
  CHECK((result.x - target).stableNorm() <= Approx(epsilon).margin(1e-10));
  CHECK(result.good);
  primaldual
      .l1_proximal([](t_Vector &output, const t_real &gamma, const t_Vector &input) {
        output = gamma * input;
      })
      .l1_proximal_weighted(
          [](t_Vector &output, const Vector<t_real> &gamma, const t_Vector &input) {
            output = 10 * gamma.array() * input.array();
          });
  CHECK_THROWS(primaldual());
}
TEST_CASE("Primal Dual with 0.5 * ||x - x0||_2^2 function", "[primaldual]") {
  using namespace sopt;
  t_Vector const target0 = t_Vector::Random(N);
  auto const f = [](t_Vector &out, const t_real gamma, const t_Vector &x) {
    proximal::id(out, gamma, x);
  };
  auto const g = proximal::L2Norm<Scalar>();
  const t_Vector x_guess = t_Vector::Random(target0.size());
  const t_Vector res = x_guess - target0;
  auto const convergence = [&target0](const t_Vector &x, const t_Vector &res) -> bool {
    return x.isApprox(target0, 1e-9);
  };
  CAPTURE(target0);
  CAPTURE(x_guess);
  CAPTURE(res);
  auto const pd = algorithm::PrimalDual<Scalar>(f, g, target0)
                      .itermax(3000)
                      .gamma(0.9)
                      .rho(0.5)
                      .update_scale(0.5)
                      .is_converged(convergence);
  auto const result = pd(std::make_tuple(x_guess, res));
  CAPTURE(result.niters);
  CAPTURE(result.x);
  CAPTURE(result.residual);
  CHECK(result.x.isApprox(target0, 1e-9));
  CHECK(result.good);
  CHECK(result.niters < 200);
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
  CHECK(is_primal_dual_ref<decltype(pd.rho(1))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.xi(1))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.gamma(1e0))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.update_scale(1e0))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.positivity_constraint(true))>::value);
  CHECK(is_primal_dual_ref<decltype(pd.real_constraint(true))>::value);
}
