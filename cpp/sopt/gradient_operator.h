#ifndef SOPT_GRADIENT_OPERATOR_H
#define SOPT_GRADIENT_OPERATOR_H

#include "sopt/config.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"

namespace sopt::gradient_operator {
//! Numerical derivative of 1d vector
template <class T>
Vector<T> diff(const Vector<T> &x) {
  if (x.size() < 2) return Vector<T>::Zero(x.size());
  Vector<T> output = Vector<T>::Zero(x.size());
  output.segment(0, x.size() - 1) = x.segment(1, x.size() - 1) - x.segment(0, x.size() - 1);
  return output;
}
//! Numerical derivative adjoint of 1d vector
template <class T>
Vector<T> diff_adjoint(const Vector<T> &x) {
  Vector<T> output = Vector<T>::Zero(x.size());
  output.segment(0, x.size() - 1) -= x.segment(0, x.size() - 1);
  if (output.size() > 2) output.segment(1, x.size() - 1) = x.segment(0, x.size() - 1);
  return output;
}
//! Numerical derivative of 2d image
template <class T>
Vector<T> diff2d(const Vector<T> &x, const t_int rows, const t_int cols) {
  Matrix<T> output = Matrix<T>::Zero(rows, 2 * cols);
  const Matrix<T> &input_image = Matrix<T>::Map(x.data(), rows, cols);
  for (Eigen::Index i(0); i < rows; ++i)
    output.block(0, 0, rows, cols).row(i) = diff<T>(input_image.row(i));
  for (Eigen::Index i(0); i < cols; ++i)
    output.block(0, cols, rows, cols).col(i) = diff<T>(input_image.col(i));
  return Vector<T>::Map(output.data(), output.size());
}
//! Numerical derivative adjoint of 2d image
template <class T>
Vector<T> diff2d_adjoint(const Vector<T> &x, const t_int rows, const t_int cols) {
  const Matrix<T> &input_image = Matrix<T>::Map(x.data(), rows, 2 * cols);
  Matrix<T> output = Matrix<T>::Zero(rows, cols);
  for (Eigen::Index i(0); i < rows; ++i)
    output.row(i) += diff_adjoint<T>(input_image.block(0, 0, rows, cols).row(i));
  for (Eigen::Index i(0); i < cols; ++i)
    output.col(i) += diff_adjoint<T>(input_image.block(0, cols, rows, cols).col(i));
  return Vector<T>::Map(output.data(), output.size());
}
template <class T>
LinearTransform<Vector<T>> gradient_operator(const t_int rows, const t_int cols) {
  return LinearTransform<Vector<T>>(
      [rows, cols](Vector<T> &out, Vector<T> const &x) {
        assert(x.size() == rows * cols * 2);
        out = diff2d_adjoint(x, rows, cols) / 2.;
        assert(out.size() == rows * cols);
      },
      {{0, 1, static_cast<t_int>(rows * cols)}},
      [rows, cols](Vector<T> &out, Vector<T> const &x) {
        assert(x.size() == rows * cols);
        out = diff2d(x, rows, cols) / 2.;
        assert(out.size() == 2 * rows * cols);
      },
      {{0, 1, static_cast<t_int>(2 * rows * cols)}});
}
} // namespace sopt::gradient_operator

#endif
