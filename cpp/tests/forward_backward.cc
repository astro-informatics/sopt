#include <catch.hpp>
#include <random>
#include <vector>

#include <Eigen/Dense>

#include <sopt/imaging_forward_backward.h>
#include <sopt/logging.h>
#include <sopt/maths.h>
#include <sopt/relative_variation.h>
#include <sopt/sampling.h>
#include <sopt/types.h>
#include <sopt/utilities.h>
#include <sopt/wavelets.h>

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
typedef sopt::Matrix<Scalar> t_Matrix;
typedef sopt::t_real t_real;
typedef sopt::t_uint t_uint;
typedef sopt::t_int t_int;
typedef sopt::Image<Scalar> t_Image;
auto const N = 5;

TEST_CASE("Forward Backward with ||x - x0||_2 function", "[fb][integration]") {
  using namespace sopt;
  t_Vector const target0 = t_Vector::Random(N);
  auto const g0 = proximal::translate(proximal::EuclidianNorm(), -target0);

  t_Matrix const mId = -t_Matrix::Identity(N, N);

  auto const fb = algorithm::ForwardBackward<Scalar>(g0, t_Vector::Zero(N))
                      .Phi(mId)
                      .itermax(3000)
                      .mu(0.01)
                      .sigma(1.)
                      .beta(0.1);
  auto const result = fb();
}
TEST_CASE("Forward Backward imaging objective function") {
  t_Vector const y = t_Vector::Random(N);
  auto const phiTphi = [](t_Vector &out, t_Vector const &x) { out = x; };
  auto const Psi = t_Matrix::Identity(N, N);
  auto const fb = sopt::algorithm::ImagingForwardBackward<Scalar>(y)
                      .itermax(500)
                      .beta(1)
                      .sigma(1.)
                      .mu(0.01)
                      .relative_variation(5e-4)
                      .residual_tolerance(0)
                      .tight_frame(false)
                      .l1_proximal_tolerance(1e-4)
                      .l1_proximal_nu(1)
                      .l1_proximal_itermax(50)
                      .l1_proximal_positivity_constraint(true)
                      .l1_proximal_real_constraint(true)
                      .Psi(Psi)
                      .PhiTPhi(phiTphi);
  t_Vector const input = t_Vector::Random(N);
  const std::function<t_real(t_Vector)> objective_function = fb.objective_function();
  auto const expected = [&](t_Vector const &x) {
    return 0.01 * x.cwiseAbs().sum() + 0.5 * std::pow((y - x).norm(), 2);
  };
  auto const energy = objective_function(input);
  auto const energy_expected = expected(input);
  CAPTURE(energy);
  CAPTURE(energy_expected);
  CHECK(std::abs(energy - energy_expected) < 1e-6);
}
template <class T>
struct is_imaging_proximal_ref
    : public std::is_same<sopt::algorithm::ImagingForwardBackward<double> &, T> {};
TEST_CASE("Check type returned on setting variables") {
  // Yeah, could be static asserts
  using namespace sopt;
  using namespace sopt::algorithm;
  ImagingForwardBackward<double> fb(Vector<double>::Zero(0));
  CHECK(is_imaging_proximal_ref<decltype(fb.itermax(500))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.beta(1e-1))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.mu(1e-1))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.sigma(1e-1))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.relative_variation(5e-4))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.tight_frame(false))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.l1_proximal_tolerance(1e-2))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.l1_proximal_nu(1))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.l1_proximal_itermax(50))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.l1_proximal_positivity_constraint(true))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.l1_proximal_real_constraint(true))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.residual_convergence(1.001))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.target(Vector<double>::Zero(0)))>::value);
  typedef ConvergenceFunction<double> ConvFunc;
  CHECK(is_imaging_proximal_ref<decltype(fb.is_converged(std::declval<ConvFunc>()))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.is_converged(std::declval<ConvFunc &>()))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.is_converged(std::declval<ConvFunc &&>()))>::value);
  CHECK(
      is_imaging_proximal_ref<decltype(fb.is_converged(std::declval<ConvFunc const &>()))>::value);
  typedef LinearTransform<Vector<double>> LinTrans;
  CHECK(is_imaging_proximal_ref<decltype(fb.Psi(linear_transform_identity<double>()))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.Psi(std::declval<LinTrans>()))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.Psi(std::declval<LinTrans &&>()))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.Psi(std::declval<LinTrans &>()))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.Psi(std::declval<LinTrans const &>()))>::value);
  auto phiTphi = [](Vector<double> &out, const Vector<double> &in) { out = in; };
  CHECK(is_imaging_proximal_ref<decltype(fb.PhiTPhi(phiTphi))>::value);
}
