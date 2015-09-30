#include <random>
#include <utility>
#include "catch.hpp"

#include "sopt/utility.h"
#include "sopt/types.h"

TEST_CASE("Projector on positive quadrant", "[utility][project]") {
  using namespace sopt;

  SECTION("Real matrix") {
    t_rMatrix input = t_rMatrix::Ones(5, 5) + t_rMatrix::Random(5, 5) * 0.55;
    input(1, 1) *= -1; input(3, 2) *= -1;

    auto const expr = positive_quadrant(input);
    CAPTURE(input);
    CAPTURE(expr);
    CHECK(expr(1, 1) == Approx(0));
    CHECK(expr(3, 2) == Approx(0));

    auto value = expr.eval();
    CHECK(value(1, 1) == Approx(0));
    CHECK(value(3, 2) == Approx(0));
    value(1, 1) = input(1, 1);
    value(3, 2) = input(3, 2);
    CHECK(value.isApprox(input));
  }

  SECTION("Complex matrix") {
    t_cMatrix input = t_cMatrix::Ones(5, 5) + t_cMatrix::Random(5, 5) * 0.55;
    input.real()(1, 1) *= -1; input.real()(3, 2) *= -1;

    auto const expr = positive_quadrant(input);
    CAPTURE(input);
    CAPTURE(expr);
    CHECK(expr.imag().isApprox(t_rMatrix::Zero(5, 5)));

    auto value = expr.eval();
    CHECK(value.real()(1, 1) == Approx(0));
    CHECK(value.real()(3, 2) == Approx(0));
    value(1, 1) = input.real()(1, 1);
    value(3, 2) = input.real()(3, 2);
    CHECK(value.real().isApprox(input.real()));
    CHECK(value.imag().isApprox(0e0 * input.real()));
  }
}

TEST_CASE("Weighted l1 norm", "[utility][l1]") {
  sopt::t_rVector weight(4);
  weight << 1, 2, 3, 4;

  SECTION("Real valued") {
    sopt::t_rVector input(4);
    input << 5, -6, 7, -8;
    CHECK(sopt::l1_norm(input, weight) == Approx(5 + 12 + 21 + 32));
  }
  SECTION("Complex valued") {
    sopt::t_complex const i(0, 1);
    sopt::t_cVector input(4);
    input << 5. + 5.*i, 6. + 6.*i, 7. + 7.*i, 8. + 8.*i;
    CHECK(sopt::l1_norm(input, weight) == Approx(std::sqrt(2) * (5 + 12 + 21 + 32)));
  }
}

TEST_CASE("Soft threshhold", "[utility][threshhold]") {
  sopt::t_rVector input(6);
  input << 1e1, 2e1, 3e1, 4e1, 1e4, 2e4;
  CHECK_THROWS_AS(sopt::soft_threshhold(input, -10), std::domain_error);

  // check thresshold
  CHECK(sopt::soft_threshhold(input, 1.1e1)(0) == Approx(0));
  CHECK(not (sopt::soft_threshhold(input, 1.1e1)(1) == Approx(0)));

  // check linearity
  auto a = sopt::soft_threshhold(input, 9e0)(0);
  auto b = sopt::soft_threshhold(input, 4.5e0)(0);
  auto c = sopt::soft_threshhold(input, 2.25e0)(0);
  CAPTURE(b - a);
  CAPTURE(c - b);
  CHECK((b - a) == Approx(2*(c - b)));
}

// Checks type traits work
static_assert(not sopt::details::HasValueType<double>::value, "");
static_assert(not sopt::details::HasValueType<std::pair<double, int>>::value, "");
static_assert(sopt::details::HasValueType<std::complex<double>>::value, "");
static_assert(sopt::details::HasValueType<sopt::t_cMatrix::Scalar>::value, "");

static_assert(
    std::is_same<sopt::underlying_value_type<sopt::t_real>::type, sopt::t_real>::value, "");
static_assert(
    std::is_same<sopt::underlying_value_type<sopt::t_complex>::type, sopt::t_real>::value, "");
