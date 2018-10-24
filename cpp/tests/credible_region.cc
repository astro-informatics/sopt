#include "sopt/credible_region.h"
#include <iostream>
#include "catch.hpp"
#include "sopt/objective_functions.h"
#include "sopt/types.h"

using namespace sopt;
typedef t_complex Scalar;
typedef Vector<Scalar> t_Vector;
typedef Image<Scalar> t_Image;
t_uint rows = 128;
t_uint cols = 128;
t_uint N = rows * cols;

TEST_CASE("calculating gamma") {
  sopt::logging::set_level("debug");
  const std::function<t_real(t_Vector)> energy_function = [](const t_Vector &input) -> t_real {
    return 0.;
  };
  const t_Vector x = t_Vector::Random(N);
  CHECK(0 == energy_function(x));
  for (t_uint i = 1; i < 10; i++) {
    const t_real alpha = 0.9 + i * 0.01;
    const t_real gamma = credible_region::compute_energy_upper_bound(alpha, x, energy_function);
    CHECK(gamma == N * (std::sqrt(16 * std::log(3 / (1 - alpha)) / N) + 1));
  }
}
TEST_CASE("caculating upper and lower interval") {
  const t_Vector x = t_Vector::Constant(N, 0.5);
  const std::function<t_real(t_Vector)> energy_function = [](const t_Vector &input) -> t_real {
    return (input.array()).cwiseAbs().maxCoeff();
  };
  const t_real gamma = 1.;
  std::tuple<t_uint, t_uint, t_uint, t_uint> const region = std::make_tuple(0, 0, rows, cols);
  CAPTURE(gamma);
  t_real lower = 0;
  t_real upper = 0;
  t_real mean = 0;
  std::tie(lower, mean, upper) =
      credible_region::find_credible_interval(x, rows, cols, region, energy_function, gamma);
  CHECK(std::abs(lower + 1.5) <= 1e-2);
  CHECK(std::abs(mean - 0.5) <= 1e-2);
  CHECK(std::abs(upper - 0.5) <= 1e-2);
  CAPTURE(lower);
  CAPTURE(mean);
  CAPTURE(upper);
  std::tie(lower, mean, upper) = credible_region::find_credible_interval(
      x, rows, cols,
      std::make_tuple(std::floor(rows * 0.25), std::floor(cols * 0.25), std::floor(rows * 0.5),
                      std::floor(cols * 0.5)),
      energy_function, gamma);
  CHECK(std::abs(lower + 1.5) <= 1e-2);
  CHECK(std::abs(upper - 0.5) <= 1e-2);
  CHECK(std::abs(mean - 0.5) <= 1e-2);
  CAPTURE(lower);
  CAPTURE(mean);
  CAPTURE(upper);
}

TEST_CASE("calculating upper and lower interval grid") {
  const t_uint pix_size = 16;
  const t_uint grid_cols = std::floor(cols / pix_size);
  const t_uint grid_rows = std::floor(rows / pix_size);
  const t_real gamma = 1.;
  t_Image image = t_Image::Constant(rows, cols, 0);
  const Image<t_real> expected_lower = Image<t_real>::Constant(grid_rows, grid_cols, -gamma);
  const Image<t_real> expected_mean = Image<t_real>::Constant(grid_rows, grid_cols, 0);
  const Image<t_real> expected_upper = Image<t_real>::Constant(grid_rows, grid_cols, gamma);
  const t_Vector x = t_Vector::Map(image.data(), image.size());
  const std::function<t_real(t_Vector)> energy_function = [&](const t_Vector &input) -> t_real {
    return input.cwiseAbs().maxCoeff();
  };
  Image<t_real> lower = Image<t_real>::Zero(rows, cols);
  Image<t_real> mean = Image<t_real>::Zero(rows, cols);
  Image<t_real> upper = Image<t_real>::Zero(rows, cols);
  std::tie(lower, mean, upper) = credible_region::credible_interval_grid<t_Vector, t_real>(
      x, rows, cols, pix_size, energy_function, gamma);
  CHECK(expected_lower.isApprox(lower, 1e-2));
  CHECK(expected_mean.isApprox(mean, 1e-2));
  CHECK(expected_upper.isApprox(upper, 1e-2));
}

TEST_CASE("calculating upper and lower interval grid non const") {
  const t_uint pix_size = 16;
  rows = 145;
  cols = 153;
  N = rows * cols;
  const t_uint grid_cols = std::ceil(cols / pix_size);
  const t_uint grid_rows = std::ceil(rows / pix_size);
  t_Image image = t_Image::Constant(rows, cols, 0);
  const t_Vector x = t_Vector::Map(image.data(), image.size());
  const std::function<t_real(t_Vector)> energy_function = [&](const t_Vector &input) -> t_real {
    return input.cwiseAbs().maxCoeff();
  };
  const t_real gamma = 1.;
  Image<t_real> lower = Image<t_real>::Zero(rows, cols);
  Image<t_real> mean = Image<t_real>::Zero(rows, cols);
  Image<t_real> upper = Image<t_real>::Zero(rows, cols);
  std::tie(lower, mean, upper) = credible_region::credible_interval_grid<t_Vector, t_real>(
      x, rows, cols, pix_size, energy_function, gamma);
  Image<t_real> const expected_lower = Image<t_real>::Constant(grid_rows, grid_cols, -gamma);
  Image<t_real> const expected_mean = Image<t_real>::Constant(grid_rows, grid_cols, 0);
  Image<t_real> const expected_upper = Image<t_real>::Constant(grid_rows, grid_cols, gamma);
  CHECK(expected_lower.isApprox(lower, 1e-2));
  CHECK(expected_mean.isApprox(mean, 1e-2));
  CHECK(expected_upper.isApprox(upper, 1e-2));
}
