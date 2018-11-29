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

template <class T>
struct is_imaging_proximal_ref
    : public std::is_same<sopt::algorithm::ImagingForwardBackward<double> &, T> {};
TEST_CASE("Check type returned on setting variables") {
  // Yeah, could be static asserts
  using namespace sopt;
  using namespace sopt::algorithm;
  ImagingForwardBackward<double> fb(Vector<double>::Zero(0).eval());
  CHECK(is_imaging_proximal_ref<decltype(fb.itermax(500))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.beta(1e-1))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.gamma(1e-1))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.sigma(1e-1))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.relative_variation(5e-4))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.tight_frame(false))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.l1_proximal_tolerance(1e-2))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.l1_proximal_nu(1))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.l1_proximal_itermax(50))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.l1_proximal_positivity_constraint(true))>::value);
  CHECK(is_imaging_proximal_ref<decltype(fb.l1_proximal_real_constraint(true))>::value);
  std::function<void(Vector<double> &, const Vector<double> &)> grad;
  CHECK(is_imaging_proximal_ref<decltype(fb.l2_gradient(grad))>::value);
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
}
