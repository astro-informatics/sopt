#include <catch.hpp>
#include <random>
#include <vector>

#include <Eigen/Dense>

#include <sopt/imaging_forward_backward.h>
#include <sopt/l1_g_proximal.h>
#include <sopt/logging.h>
#include <sopt/maths.h>
#include <sopt/proximal.h>
#include <sopt/types.h>

// This header is not part of the installed sopt interface
// It is only present in tests
#include <tools_for_tests/directories.h>
#include <tools_for_tests/tiffwrappers.h>

sopt::t_int random_integer(sopt::t_int min, sopt::t_int max) {
  extern std::unique_ptr<std::mt19937_64> mersenne;
  std::uniform_int_distribution<sopt::t_int> uniform_dist(min, max);
  return uniform_dist(*mersenne);
};

typedef sopt::t_real Scalar;
typedef sopt::Vector<Scalar> t_Vector;
typedef sopt::t_real t_real;
auto const N = 5;

TEST_CASE("Forward Backward with ||x - x0||_2^2 function", "[fb]") {
  using namespace sopt;
  t_Vector const target0 = t_Vector::Random(N);
  auto const g0 = [](t_Vector &out, const t_real gamma, const t_Vector &x) {
    proximal::id(out, gamma, x);
  };
  auto const grad = [](t_Vector &out, const t_Vector &x) { out = x; };
  const t_Vector x_guess = t_Vector::Random(target0.size());
  const t_Vector res = x_guess - target0;
  auto const convergence = [&target0](const t_Vector &x, const t_Vector &res) -> bool {
    return x.isApprox(target0, 1e-9);
  };
  CAPTURE(target0);
  CAPTURE(x_guess);
  CAPTURE(res);
  auto const fb = algorithm::ForwardBackward<Scalar>(grad, g0, target0)
                      .itermax(300)
                      .gamma(0.1)
                      .beta(0.2)
                      .is_converged(convergence);
  auto const result = fb(std::make_tuple(x_guess, res));
  CAPTURE(result.niters);
  CAPTURE(result.x);
  CAPTURE(result.residual);
  CHECK(result.x.isApprox(target0, 1e-9));
  CHECK(result.good);
  CHECK(result.niters < 300);
}

template <class T> struct is_imaging_proximal_ref
    : public std::is_same<sopt::algorithm::ImagingForwardBackward<double> &, T> {};
template <class T> struct is_l1_g_proximal_ref
    : public std::is_same<sopt::algorithm::L1GProximal<double> &, T> {};

TEST_CASE("Check type returned on setting variables") {
  // Yeah, could be static asserts
  using namespace sopt;
  using namespace sopt::algorithm;
  ImagingForwardBackward<double> fb(Vector<double>::Zero(0).eval());
  CHECK(is_imaging_proximal_ref<decltype(fb.itermax(500))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.beta(1e-1))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.gamma(1e-1))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.sigma(1e-1))>::value);
  std::function<void(Vector<double> &, const Vector<double> &)> grad;
  CHECK(is_imaging_proximal_ref<decltype(fb.l2_gradient(grad))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.residual_convergence(1.001))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.target(Vector<double>::Zero(0)))>::value);
  typedef ConvergenceFunction<double> ConvFunc;
  CHECK(is_imaging_proximal_ref<decltype(fb.is_converged(std::declval<ConvFunc>()))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.is_converged(std::declval<ConvFunc &>()))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.is_converged(std::declval<ConvFunc &&>()))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.is_converged(std::declval<ConvFunc const &>()))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.relative_variation(5e-4))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.tight_frame(false))>::value);

  // Test the types of the l1 g_proximal object separately
  auto gp = std::make_shared<sopt::algorithm::L1GProximal<Scalar>>(fb.beta(), fb.Phi(), false);
  CHECK(is_l1_g_proximal_ref<decltype(gp->l1_proximal_tolerance(1e-2))>::value);
  CHECK(is_l1_g_proximal_ref<decltype(gp->l1_proximal_nu(1))>::value);
  CHECK(is_l1_g_proximal_ref<decltype(gp->l1_proximal_itermax(50))>::value);
  CHECK(is_l1_g_proximal_ref<decltype(gp->l1_proximal_positivity_constraint(true))>::value);
  CHECK(is_l1_g_proximal_ref<decltype(gp->l1_proximal_real_constraint(true))>::value);
  typedef LinearTransform<Vector<double>> LinTrans;
  CHECK(is_l1_g_proximal_ref<decltype(gp->Psi(linear_transform_identity<double>()))>::value);
  CHECK(is_l1_g_proximal_ref<decltype(gp->Psi(std::declval<LinTrans>()))>::value);
  CHECK(is_l1_g_proximal_ref<decltype(gp->Psi(std::declval<LinTrans &&>()))>::value);
  CHECK(is_l1_g_proximal_ref<decltype(gp->Psi(std::declval<LinTrans &>()))>::value);
  CHECK(is_l1_g_proximal_ref<decltype(gp->Psi(std::declval<LinTrans const &>()))>::value);
}
