
#include <catch2/catch_all.hpp>
#include <complex>
#include <iomanip>

#include "sopt/chained_operators.h"
#include "sopt/linear_transform.h"
TEST_CASE("Linear Transforms", "[ops]") {
  using namespace sopt;

  using SCALAR = int;
  using t_Vector = Vector<SCALAR>;
  auto constexpr N = 5;

  SECTION("1 Functions") {
    OperatorFunction<t_Vector> const func0 = [](t_Vector &out, t_Vector const &input) {
      out = input.array() * 2 - 1;
    };
    OperatorFunction<t_Vector> const func1 = [](t_Vector &out, t_Vector const &input) {
      out = input.array() * 4 - 1;
    };
    t_Vector const x = t_Vector::Random(2 * N) * 5;
    auto chain = chained_operators(func0);

    t_Vector actual;
    t_Vector expected;
    func0(actual, x);
    chain(expected, x);
    CHECK(actual == expected);
  }

  SECTION("2 Functions") {
    OperatorFunction<t_Vector> const func0 = [](t_Vector &out, t_Vector const &input) {
      out = input.array() * 2 - 1;
    };
    OperatorFunction<t_Vector> const func1 = [](t_Vector &out, t_Vector const &input) {
      out = input.array() * 4 - 1;
    };
    t_Vector const x = t_Vector::Random(2 * N) * 5;
    auto chain = chained_operators(func0, func1);

    t_Vector actual;
    t_Vector expected;
    func1(expected, x);
    func0(actual, expected);
    chain(expected, x);
    CHECK(actual == expected);
  }

  SECTION("3 Functions") {
    OperatorFunction<t_Vector> const func0 = [](t_Vector &out, t_Vector const &input) {
      out = input.array() * 2 - 1;
    };
    OperatorFunction<t_Vector> const func1 = [](t_Vector &out, t_Vector const &input) {
      out = input.array() * 4 - 1;
    };
    t_Vector const x = t_Vector::Random(2 * N) * 5;
    auto chain = chained_operators(func0, func1, func0);

    t_Vector actual;
    t_Vector expected;
    func0(actual, x);
    func1(expected, actual);
    func0(actual, expected);
    chain(expected, x);
    CHECK(actual == expected);
  }

  SECTION("4 Functions") {
    OperatorFunction<t_Vector> const func0 = [](t_Vector &out, t_Vector const &input) {
      out = input.array() * 2 - 1;
    };
    OperatorFunction<t_Vector> const func1 = [](t_Vector &out, t_Vector const &input) {
      out = input.array() * 4 - 1;
    };
    t_Vector const x = t_Vector::Random(2 * N) * 5;
    auto chain = chained_operators(func0, func1, func0, func0);

    t_Vector actual;
    t_Vector expected;
    func0(expected, x);
    func0(actual, expected);
    func1(expected, actual);
    func0(actual, expected);
    chain(expected, x);
    CHECK(actual == expected);
  }

  SECTION("linear transform") {
    OperatorFunction<t_Vector> const func0 = [](t_Vector &out, t_Vector const &input) {
      out = input.head(N - 1).array() * 2;
    };
    OperatorFunction<t_Vector> const func1 = [](t_Vector &out, t_Vector const &input) {
      out = input.head(N - 1).array() * 4;
    };
    OperatorFunction<t_Vector> const afunc0 = [](t_Vector &out, t_Vector const &input) {
      out = t_Vector::Zero(N);
      out.head(N - 1) = input.head(N - 1).array() * 2;
    };
    OperatorFunction<t_Vector> const afunc1 = [](t_Vector &out, t_Vector const &input) {
      out = t_Vector::Zero(N);
      out.head(N - 1) = input.head(N - 1).array() * 4;
    };
    t_Vector const x = t_Vector::Random(2 * N) * 5;
    auto chain = chained_operators(func0, func1, func0, func0);
    auto chain_adjoint = chained_operators(afunc0, afunc0, afunc1, afunc0);
    auto op = LinearTransform<t_Vector>{chain, chain_adjoint};
    t_Vector actual;
    t_Vector expected;
    chain(actual, x);
    expected = op * x;
    CHECK(expected == x.head(N - 1) * 32);
    CHECK(actual == expected);
    chain_adjoint(actual, x.head(N - 1));
    expected = op.adjoint() * x.head(N - 1);
    CHECK(actual == expected);
  }
}
