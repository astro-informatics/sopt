
#include <catch.hpp>
#include <complex>
#include <iomanip>

#include "sopt/linear_transform.h"
#include "sopt/chained_operators.h"
TEST_CASE("Linear Transforms", "[ops]") {
  using namespace sopt;

  typedef int SCALAR;
  typedef Vector<SCALAR> t_Vector;
  auto const N = 10;

  SECTION("Functions") {

    OperatorFunction<t_Vector> const func0 = [](t_Vector &out, t_Vector const &input) { out = input.array() * 2 - 1; };
    OperatorFunction<t_Vector> const func1 = [](t_Vector &out, t_Vector const &input) { out = input.array() * 4 - 1; };
    t_Vector const x = t_Vector::Random(2 * N) * 5;
    auto chain = chained_operators(func0, func1, func0, func0);

    t_Vector actual, expected;
    func0(expected, x);
    func0(actual, expected);
    func1(expected, actual);
    func0(actual, expected);
    chain(expected, x);
    CHECK(actual == expected);
  }

}
