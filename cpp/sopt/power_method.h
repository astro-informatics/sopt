#ifndef SOPT_POWER_METHO_H
#define SOPT_POWER_METHO_H

#include "sopt/config.h"
#include <functional>
#include <limits>
#include <tuple>
#include "sopt/exception.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/types.h"

namespace sopt {
namespace algorithm {
//! \brief Returns the eigenvalue and eigenvector for eigenvalue of the Linear Transform with
//! largest magnitude
template <class T>
std::tuple<t_real, T> power_method(const sopt::LinearTransform<T> &op, const t_uint &niters,
                                   const t_real &relative_difference, const T &initial_vector) {
  /*
     Attempt at coding the power method, returns the sqrt of the largest eigen value of a linear
     operator composed with its adjoint niters:: max number of iterations relative_difference::
     percentage difference at which eigen value has converged
     */
  if (niters <= 0) return std::make_tuple(1., initial_vector);
  t_real estimate_eigen_value = 1;
  t_real old_value = 0;
  T estimate_eigen_vector = initial_vector;
  estimate_eigen_vector = estimate_eigen_vector / estimate_eigen_vector.matrix().stableNorm();
  SOPT_DEBUG("Starting power method");
  SOPT_DEBUG(" -[PM] Iteration: 0, norm = {}", estimate_eigen_value);
  for (t_int i = 0; i < niters; ++i) {
    estimate_eigen_vector = op.adjoint() * (op * estimate_eigen_vector);
    estimate_eigen_value = estimate_eigen_vector.matrix().stableNorm();
    if (estimate_eigen_value <= 0) throw std::runtime_error("Error in operator.");
    if (estimate_eigen_value != estimate_eigen_value)
      throw std::runtime_error("Error in operator or data corrupted.");
    estimate_eigen_vector = estimate_eigen_vector / estimate_eigen_value;
    t_real const rel_diff = std::abs(old_value - estimate_eigen_value) / old_value;
    SOPT_DEBUG(" -[PM] Iteration: {}, norm = {}", i + 1, estimate_eigen_value);
    SOPT_DEBUG(" -[PM] Relative Difference = {} ( < {})", std::sqrt(rel_diff), relative_difference);
    if (relative_difference * relative_difference > rel_diff) {
      old_value = estimate_eigen_value;
      SOPT_DEBUG("Converged to norm = {}, relative difference < {}", std::sqrt(old_value),
                 relative_difference);
      break;
    }
    old_value = estimate_eigen_value;
  }
  return std::make_tuple(std::sqrt(old_value), estimate_eigen_vector);
}

template <class T>
std::tuple<t_real, T, std::shared_ptr<sopt::LinearTransform<T>>> normalise_operator(
    const std::shared_ptr<sopt::LinearTransform<T> const> &op, const t_uint &niters,
    const t_real &relative_difference, const T &initial_vector) {
  const auto result = power_method<T>(*op, niters, relative_difference, initial_vector);
  const t_real norm = std::get<0>(result);
  return std::make_tuple(
      std::get<0>(result), std::get<1>(result),
      std::make_shared<sopt::LinearTransform<T>>(
          [op, norm](T &output, const T &input) { output = (*op * input) / norm; }, op->sizes(),
          [op, norm](T &output, const T &input) { output = (op->adjoint() * input) / norm; },
          op->adjoint().sizes()));
}
template <class T>
std::tuple<t_real, T, sopt::LinearTransform<T>> normalise_operator(
    const sopt::LinearTransform<T> &op, const t_uint &niters, const t_real &relative_difference,
    const T &initial_vector) {
  const std::shared_ptr<sopt::LinearTransform<T>> shared_op =
      std::make_shared<sopt::LinearTransform<T>>(std::move(op));
  const auto result = normalise_operator<T>(shared_op, niters, relative_difference, initial_vector);
  const auto normed_shared_op = std::get<2>(result);
  return std::make_tuple(std::get<0>(result), std::get<1>(result), *normed_shared_op);
}
//! \brief Eigenvalue and eigenvector for eigenvalue with largest magnitude
template <class SCALAR>
class PowerMethod {
 public:
  //! Scalar type
  typedef SCALAR value_type;
  //! Scalar type
  typedef value_type Scalar;
  //! Real type
  typedef typename real_type<Scalar>::type Real;
  //! Type of then underlying vectors
  typedef Vector<Scalar> t_Vector;
  //! Type of the Ψ and Ψ^H operations, as well as Φ and Φ^H
  typedef LinearTransform<t_Vector> t_LinearTransform;

  //! Holds result vector as well
  struct DiagnosticAndResult {
    //! Number of iterations
    t_uint niters;
    //! Wether convergence was achieved
    bool good;
    //! Magnitude of the eigenvalue
    Scalar magnitude;
    //! Corresponding eigenvector if converged
    Vector<Scalar> eigenvector;
  };

  //! Setups ProximalADMM
  PowerMethod() : itermax_(std::numeric_limits<t_uint>::max()), tolerance_(1e-8) {}
  virtual ~PowerMethod() {}

// Macro helps define properties that can be initialized as in
// auto sdmm  = ProximalADMM<float>().prop0(value).prop1(value);
#define SOPT_MACRO(NAME, TYPE)                  \
  TYPE const &NAME() const { return NAME##_; }  \
  PowerMethod<SCALAR> &NAME(TYPE const &NAME) { \
    NAME##_ = NAME;                             \
    return *this;                               \
  }                                             \
                                                \
 protected:                                     \
  TYPE NAME##_;                                 \
                                                \
 public:

  //! Maximum number of iterations
  SOPT_MACRO(itermax, t_uint)
  //! Convergence criteria
  SOPT_MACRO(tolerance, Real)
#undef SOPT_MACRO
  //! \brief Calls the power method for A.adjoint() * A
  DiagnosticAndResult AtA(t_LinearTransform const &A, t_Vector const &input) const;

  //! \brief Calls the power method for A, with A a matrix
  template <class DERIVED>
  DiagnosticAndResult operator()(Eigen::DenseBase<DERIVED> const &A, t_Vector const &input) const;

  //! \brief Calls the power method for a given matrix-vector multiplication function
  DiagnosticAndResult operator()(OperatorFunction<t_Vector> const &op, t_Vector const &input) const;

 protected:
};

template <class SCALAR>
typename PowerMethod<SCALAR>::DiagnosticAndResult PowerMethod<SCALAR>::AtA(
    t_LinearTransform const &A, t_Vector const &input) const {
  auto const op = [&A](t_Vector &out, t_Vector const &input) -> void {
    out = A.adjoint() * (A * input).eval();
  };
  return operator()(op, input);
}

template <class SCALAR>
template <class DERIVED>
typename PowerMethod<SCALAR>::DiagnosticAndResult PowerMethod<SCALAR>::operator()(
    Eigen::DenseBase<DERIVED> const &A, t_Vector const &input) const {
  Matrix<Scalar> const Ad = A.derived();
  auto const op = [&Ad](t_Vector &out, t_Vector const &input) -> void { out = Ad * input; };
  return operator()(op, input);
}

template <class SCALAR>
typename PowerMethod<SCALAR>::DiagnosticAndResult PowerMethod<SCALAR>::operator()(
    OperatorFunction<t_Vector> const &op, t_Vector const &input) const {
  SOPT_INFO("Computing the upper bound of a given operator");
  SOPT_INFO("    - input vector {}", input.transpose());
  t_Vector eigenvector = input.normalized();
  SOPT_INFO("    - eigenvector norm {}", eigenvector.stableNorm());
  typename t_Vector::Scalar previous_magnitude = 1;
  bool converged = false;
  t_uint niters = 0;

  for (; niters < itermax() and converged == false; ++niters) {
    op(eigenvector, eigenvector);
    typename t_Vector::Scalar const magnitude =
        eigenvector.stableNorm() / static_cast<Real>(eigenvector.size());
    auto const rel_val = std::abs((magnitude - previous_magnitude) / previous_magnitude);
    converged = rel_val < tolerance();
    SOPT_INFO("    - [PM] iteration {}/{} -- norm: {}", niters, itermax(), magnitude);

    eigenvector /= magnitude;
    previous_magnitude = magnitude;
  }
  // check function exists, otherwise, don't know if convergence is meaningful
  if (not converged) {
    SOPT_WARN("    - [PM] did not converge within {} iterations", itermax());
  } else {
    SOPT_INFO("    - [PM] converged in {} of {} iterations", niters, itermax());
  }
  return DiagnosticAndResult{itermax(), converged, previous_magnitude, eigenvector.normalized()};
}
}  // namespace algorithm
}  // namespace sopt
#endif
