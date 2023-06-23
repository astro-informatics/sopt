#ifndef SOPT_CREDIBLE_REGION_H
#define SOPT_CREDIBLE_REGION_H

#include "sopt/config.h"
#include <functional>
#include <iostream>
#include <type_traits>
#include "sopt/bisection_method.h"
#include "sopt/exception.h"
#include "sopt/logging.h"
#include "sopt/types.h"

namespace sopt {
namespace credible_region {

template <class T>
t_real compute_energy_upper_bound(
    const t_real &alpha, const Eigen::MatrixBase<T> &solution,
    const std::function<t_real(typename T::PlainObject)> &objective_function);

template <class T>
std::tuple<t_real, t_real, t_real> find_credible_interval(
    const Eigen::MatrixBase<T> &solution, const t_uint &rows, const t_uint &cols,
    const std::tuple<t_uint, t_uint, t_uint, t_uint> &region,
    const std::function<t_real(typename T::PlainObject)> &objective_function,
    const t_real &energy_upperbound);

template <class T, class K>
typename std::enable_if<is_complex<K>::value or std::is_arithmetic<K>::value,
                        std::tuple<Image<K>, Image<K>, Image<K>>>::type
credible_interval_grid(const Eigen::MatrixBase<T> &solution, const t_uint &rows, const t_uint &cols,
                       const t_uint &grid_pixel_size,
                       const std::function<t_real(typename T::PlainObject)> &objective_function,
                       const t_real &energy_upperbound);

template <class T, class K>
typename std::enable_if<is_complex<K>::value or std::is_arithmetic<K>::value,
                        std::tuple<Image<K>, Image<K>, Image<K>>>::type
credible_interval_grid(const Eigen::MatrixBase<T> &solution, const t_uint &rows, const t_uint &cols,
                       const std::tuple<t_uint, t_uint> &grid_pixel_size,
                       const std::function<t_real(typename T::PlainObject)> &objective_function,
                       const t_real &energy_upperbound);
template <class T, class K>
typename std::enable_if<is_complex<K>::value or std::is_arithmetic<K>::value,
                        std::tuple<Image<K>, Image<K>, Image<K>>>::type
credible_interval(const Eigen::MatrixBase<T> &solution, const t_uint &rows, const t_uint &cols,
                  const t_uint &grid_pixel_size,
                  const std::function<t_real(typename T::PlainObject)> &objective_function,
                  const t_real &alpha);
template <class T, class K>
typename std::enable_if<is_complex<K>::value or std::is_arithmetic<K>::value,
                        std::tuple<Image<K>, Image<K>, Image<K>>>::type
credible_interval(const Eigen::MatrixBase<T> &solution, const t_uint &rows, const t_uint &cols,
                  const std::tuple<t_uint, t_uint> &grid_pixel_size,
                  const std::function<t_real(typename T::PlainObject)> &objective_function,
                  const t_real &alpha);
}  // namespace credible_region
}  // namespace sopt

namespace sopt {
namespace credible_region {

template <class T>
t_real compute_energy_upper_bound(
    const t_real &alpha, const Eigen::MatrixBase<T> &solution,
    const std::function<t_real(typename T::PlainObject)> &objective_function) {
  if (alpha <= 0) SOPT_THROW("α must positive.");
  if (alpha >= 1) SOPT_THROW("α must less than 1.");
  const t_real N = solution.size();
  const t_real energy = objective_function(solution);
  auto const gamma = energy + N * (std::sqrt(16 * std::log(3 / (1 - alpha)) / N) + 1);
  SOPT_MEDIUM_LOG("Confidence interval: %{}", 100 * alpha);
  SOPT_MEDIUM_LOG("γ = {}, g(x_s) = {}", gamma, energy);
  return gamma;
}

template <class T>
std::tuple<t_real, t_real, t_real> find_credible_interval(
    const Eigen::MatrixBase<T> &solution, const t_uint &rows, const t_uint &cols,
    const std::tuple<t_uint, t_uint, t_uint, t_uint> &region,
    const std::function<t_real(typename T::PlainObject)> &objective_function,
    const t_real &energy_upperbound) {
  typedef typename T::PlainObject Derived;
  assert(energy_upperbound > 0);
  if (solution.size() != cols * rows) SOPT_THROW("Solution is wrong size for credible interval.");
  if ((std::get<2>(region) > rows) or (std::get<3>(region) > cols))
    SOPT_THROW("Region is out of bounds.");
  if (energy_upperbound <= 0)
    SOPT_THROW("Energy upper bound is not positive when calculating credible interval.");

  const std::shared_ptr<Matrix<typename T::Scalar>> varried_solution =
      std::make_shared<Matrix<typename T::Scalar>>(solution);
  *varried_solution = Matrix<typename T::Scalar>::Map(varried_solution->data(), rows, cols);
  const t_real mean = varried_solution
                          ->block(std::get<0>(region), std::get<1>(region), std::get<2>(region),
                                  std::get<3>(region))
                          .array()
                          .real()
                          .mean();
  const t_real b = (mean > 0)
                       ? solution.cwiseAbs().maxCoeff() * 3
                       : std::max(solution.stableNorm(), static_cast<t_real>(solution.size()));
  std::function<t_real(t_real)> const bound_estimater = [=](const t_real &x) -> t_real {
    varried_solution
        ->block(std::get<0>(region), std::get<1>(region), std::get<2>(region), std::get<3>(region))
        .fill(mean + x);
    return objective_function(
        Vector<typename T::Scalar>::Map(varried_solution->data(), varried_solution->size()));
  };

  const t_real bound_lower =
      sopt::bisection_method(energy_upperbound, bound_estimater, -b, 0., 1e-3);
  const t_real bound_upper =
      sopt::bisection_method(energy_upperbound, bound_estimater, 0., b, 1e-3);
  return std::make_tuple(bound_lower, mean, bound_upper);
}
template <class T, class K>
typename std::enable_if<is_complex<K>::value or std::is_arithmetic<K>::value,
                        std::tuple<Image<K>, Image<K>, Image<K>>>::type
credible_interval_grid(const Eigen::MatrixBase<T> &solution, const t_uint &rows, const t_uint &cols,
                       const t_uint &grid_pixel_size,
                       const std::function<t_real(typename T::PlainObject)> &objective_function,
                       const t_real &energy_upperbound) {
  const std::tuple<t_uint, t_uint> grid_pixel_size_2d =
      std::make_tuple(std::min(grid_pixel_size, rows), std::min(grid_pixel_size, cols));
  return credible_interval_grid<typename T::PlainObject, K>(
      solution, rows, cols, grid_pixel_size_2d, objective_function, energy_upperbound);
}

template <class T, class K>
typename std::enable_if<is_complex<K>::value or std::is_arithmetic<K>::value,
                        std::tuple<Image<K>, Image<K>, Image<K>>>::type
credible_interval_grid(const Eigen::MatrixBase<T> &solution, const t_uint &rows, const t_uint &cols,
                       const std::tuple<t_uint, t_uint> &grid_pixel_size,
                       const std::function<t_real(typename T::PlainObject)> &objective_function,
                       const t_real &energy_upperbound) {
  if ((std::get<0>(grid_pixel_size) > rows) or (std::get<1>(grid_pixel_size) > cols))
    SOPT_THROW("Grid pixel size too big.");
  typedef typename T::PlainObject Derived;
  const t_uint drow = std::get<0>(grid_pixel_size);
  const t_uint dcol = std::get<1>(grid_pixel_size);
  const t_uint grid_rows = std::floor(static_cast<t_real>(rows) / drow);
  const t_uint grid_cols = std::floor(static_cast<t_real>(cols) / dcol);
  Image<K> credible_grid_lower_bound = Image<K>::Zero(grid_rows, grid_cols);
  Image<K> credible_grid_upper_bound = Image<K>::Zero(grid_rows, grid_cols);
  Image<K> credible_grid_mean = Image<K>::Zero(grid_rows, grid_cols);
  SOPT_LOW_LOG("Starting calculation of credible interval: {} x {} grid.", grid_rows, grid_cols);
  for (t_uint i = 0; i < grid_rows; ++i) {
    for (t_uint j = 0; j < grid_cols; ++j) {
      const t_uint start_row = i * drow;
      const t_uint start_col = j * dcol;
      if (static_cast<t_int>(rows - start_row - drow) < 0)
        SOPT_THROW("Interval grid calculation going out of bounds.");
      if (static_cast<t_int>(cols - start_col - dcol) < 0)
        SOPT_THROW("Interval grid calculation going out of bounds.");
      const t_uint delta_row =
          ((drow > (rows - start_row - drow)) and ((rows - start_row - drow) > 0))
              ? rows - start_row - drow
              : drow;
      const t_uint delta_col =
          ((dcol > (cols - start_col - dcol)) and ((cols - start_col - dcol) > 0))
              ? cols - start_col - dcol
              : dcol;
      SOPT_LOW_LOG("Grid pixel ({}, {}): [{}, {}) x [{}, {})", i, j, start_row,
                   start_row + delta_row, start_col, start_col + delta_col);
      const auto region = std::make_tuple(start_row, start_col, delta_row, delta_col);
      const std::tuple<t_real, t_real, t_real> bounds = find_credible_interval(
          solution, rows, cols, region, objective_function, energy_upperbound);
      SOPT_LOW_LOG("η- = {}, mean = {}, η+ = {}", std::get<0>(bounds), std::get<1>(bounds),
                   std::get<2>(bounds));
      credible_grid_lower_bound(i, j) = std::get<0>(bounds);
      credible_grid_mean(i, j) = std::get<1>(bounds);
      credible_grid_upper_bound(i, j) = std::get<2>(bounds);
    }
  }
  return std::make_tuple(credible_grid_lower_bound, credible_grid_mean, credible_grid_upper_bound);
}
template <class T, class K>
typename std::enable_if<is_complex<K>::value or std::is_arithmetic<K>::value,
                        std::tuple<Image<K>, Image<K>, Image<K>>>::type
credible_interval(const Eigen::MatrixBase<T> &solution, const t_uint &rows, const t_uint &cols,
                  const std::tuple<t_uint, t_uint> &grid_pixel_size,
                  const std::function<t_real(typename T::PlainObject)> &objective_function,
                  const t_real &alpha) {
  const t_real energy_upperbound = compute_energy_upper_bound(alpha, solution, objective_function);
  return credible_interval_grid<typename T::PlainObject, K>(solution, rows, cols, grid_pixel_size,
                                                            objective_function, energy_upperbound);
}
template <class T, class K>
typename std::enable_if<is_complex<K>::value or std::is_arithmetic<K>::value,
                        std::tuple<Image<K>, Image<K>, Image<K>>>::type
credible_interval(const Eigen::MatrixBase<T> &solution, const t_uint &rows, const t_uint &cols,
                  const t_uint &grid_pixel_size,
                  const std::function<t_real(typename T::PlainObject)> &objective_function,
                  const t_real &alpha) {
  const t_real energy_upperbound = compute_energy_upper_bound(alpha, solution, objective_function);
  return credible_interval_grid<typename T::PlainObject, K>(solution, rows, cols, grid_pixel_size,
                                                            objective_function, energy_upperbound);
}
}  // namespace credible_region

}  // namespace sopt

#endif
