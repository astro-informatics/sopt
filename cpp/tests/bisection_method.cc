#include <catch2/catch_all.hpp>
#include <random>

#include <Eigen/Dense>

#include "sopt/bisection_method.h"
#include "sopt/types.h"

using Scalar = sopt::t_real;
using t_Vector = sopt::Vector<Scalar>;
using t_Matrix = sopt::Matrix<Scalar>;

const Scalar a = -0.5;
const Scalar b = 1.;
const Scalar tol = 1e-4;
TEST_CASE("Bisection x^3") {
  using namespace sopt;
  sopt::logging::set_level("debug");
  std::function<Scalar(Scalar)> const func = [](const Scalar &x) -> Scalar { return x * x * x; };
  const Scalar x0 = 0;
  const Scalar x0_est = bisection_method(func(x0), func, a, b, tol);
  CHECK(std::abs(x0_est - x0) <= tol);
}
TEST_CASE("Bisection f(x) = x") {
  using namespace sopt;
  std::function<Scalar(Scalar)> const func = [](const Scalar &x) -> Scalar { return x; };
  const Scalar x0 = 0.23235104239409;
  const Scalar x0_est = bisection_method(func(x0), func, a, b, tol);
  CHECK(std::abs(x0_est - x0) <= tol);
}
TEST_CASE("Bisection exp()") {
  using namespace sopt;
  std::function<Scalar(Scalar)> const func = [](const Scalar &x) -> Scalar { return std::exp(-x); };
  const Scalar x0 = 1;
  const Scalar x0_est = bisection_method(func(x0), func, a, b, tol);
  CHECK(std::abs(x0_est - x0) <= tol);
}
