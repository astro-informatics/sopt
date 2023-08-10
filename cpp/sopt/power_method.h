#ifndef SOPT_POWER_METHO_H
#define SOPT_POWER_METHO_H

#include "sopt/config.h"
#include <functional>
#include <limits>
#include <memory> // for std::shared_ptr<>
#include <tuple>
#include <utility> // for std::move<>
#include "sopt/exception.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/relative_variation.h"
#include "sopt/types.h"
#ifdef SOPT_MPI
#include "sopt/mpi/communicator.h"
#endif

namespace sopt::algorithm {
//! \brief Returns the eigenvalue and eigenvector for eigenvalue of the Linear Transform with
//! largest magnitude
template <typename T>
std::tuple<t_real, T> power_method(const sopt::LinearTransform<T> &op, const t_uint niters,
                                   const t_real relative_difference, const T &initial_vector) {
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
  bool converged = false;
  ScalarRelativeVariation<t_real> scalvar(relative_difference, 0., "Eigenvalue");
  for (t_int i = 0; i < niters; ++i) {
    estimate_eigen_vector = op.adjoint() * static_cast<T>(op * estimate_eigen_vector);
    estimate_eigen_value = estimate_eigen_vector.matrix().stableNorm();
    if (estimate_eigen_value <= 0) throw std::runtime_error("Error in operator.");
    if (estimate_eigen_value != estimate_eigen_value)
      throw std::runtime_error("Error in operator or data corrupted.");
    estimate_eigen_vector = estimate_eigen_vector / estimate_eigen_value;
    SOPT_DEBUG(" -[PM] Iteration: {}, norm = {}", i + 1, estimate_eigen_value);
    converged = scalvar(std::sqrt(estimate_eigen_value));
    old_value = estimate_eigen_value;
    if (converged) {
      SOPT_DEBUG("Converged to norm = {}, relative difference < {}", std::sqrt(old_value),
                 relative_difference);
      break;
    }
  }
  return std::make_tuple(std::sqrt(old_value), estimate_eigen_vector);
}

template <typename T>
std::tuple<t_real, T, std::shared_ptr<sopt::LinearTransform<T>>> normalise_operator(
    const std::shared_ptr<sopt::LinearTransform<T> const> &op, const t_uint &niters,
    const t_real &relative_difference, const T &initial_vector) {
  const auto result = power_method(*op, niters, relative_difference, initial_vector.derived());
  const t_real norm = std::get<0>(result);
  return std::make_tuple(
      std::get<0>(result), std::get<1>(result),
      std::make_shared<sopt::LinearTransform<T>>(
          [op, norm](T &output, const T &input) { output = static_cast<T>(*op * input) / norm; },
          op->sizes(),
          [op, norm](T &output, const T &input) {
            output = static_cast<T>(op->adjoint() * input) / norm;
          },
          op->adjoint().sizes()));
}
template <typename T>
std::tuple<t_real, T, sopt::LinearTransform<T>> normalise_operator(
    const sopt::LinearTransform<T> &op, const t_uint &niters, const t_real &relative_difference,
    const T &initial_vector) {
  const std::shared_ptr<sopt::LinearTransform<T>> shared_op =
      std::make_shared<sopt::LinearTransform<T>>(std::move(op));
  const auto result = normalise_operator<T>(shared_op, niters, relative_difference, initial_vector);
  const auto normed_shared_op = std::get<2>(result);
  return std::make_tuple(std::get<0>(result), std::get<1>(result), *normed_shared_op);
}
#ifdef SOPT_MPI
//! Performs an all sum all operation to collectively normalise different serial operators
template <typename T>
std::tuple<t_real, T> all_sum_all_power_method(const sopt::mpi::Communicator &comm,
                                               const sopt::LinearTransform<T> &op,
                                               const t_uint &niters,
                                               const t_real &relative_difference,
                                               const T &initial_vector) {
  const auto all_sum_all_op = sopt::LinearTransform<T>(
      [&op](T &output, const T &input) { output = static_cast<T>(op * input); }, op.sizes(),
      [&op, comm](T &output, const T &input) {
        output = comm.all_sum_all(static_cast<T>(op.adjoint() * input));
      },
      op.adjoint().sizes());
  return power_method(all_sum_all_op, niters, relative_difference, initial_vector.derived());
}
template <typename T>
std::tuple<t_real, T, std::shared_ptr<sopt::LinearTransform<T>>> all_sum_all_normalise_operator(
    const sopt::mpi::Communicator &comm, const std::shared_ptr<sopt::LinearTransform<T> const> &op,
    const t_uint &niters, const t_real &relative_difference, const T &initial_vector) {
  const auto all_sum_all_op = sopt::LinearTransform<T>(
      [op](T &output, const T &input) { output = static_cast<T>(*op * input); }, op->sizes(),
      [op, comm](T &output, const T &input) {
        output = comm.all_sum_all(static_cast<T>(op->adjoint() * input));
      },
      op->adjoint().sizes());
  const auto result =
      power_method(all_sum_all_op, niters, relative_difference, initial_vector.derived());
  const t_real norm = std::get<0>(result);
  return std::make_tuple(
      std::get<0>(result), std::get<1>(result),
      std::make_shared<sopt::LinearTransform<T>>(
          [op, norm](T &output, const T &input) { output = static_cast<T>(*op * input) / norm; },
          op->sizes(),
          [op, norm](T &output, const T &input) {
            output = static_cast<T>(op->adjoint() * input) / norm;
          },
          op->adjoint().sizes()));
}
template <typename T>
std::tuple<t_real, T, sopt::LinearTransform<T>> all_sum_all_normalise_operator(
    const sopt::mpi::Communicator &comm, const sopt::LinearTransform<T> &op, const t_uint &niters,
    const t_real &relative_difference, const T &initial_vector) {
  const std::shared_ptr<sopt::LinearTransform<T>> shared_op =
      std::make_shared<sopt::LinearTransform<T>>(std::move(op));
  const auto result =
      normalise_operator<T>(comm, shared_op, niters, relative_difference, initial_vector);
  const auto normed_shared_op = std::get<2>(result);
  return std::make_tuple(std::get<0>(result), std::get<1>(result), *normed_shared_op);
}
#endif
//! \brief Eigenvalue and eigenvector for eigenvalue with largest magnitude
template <typename SCALAR>
class PowerMethod {
 public:
  //! Scalar type
  using value_type = SCALAR;
  //! Scalar type
  using Scalar = value_type;
  //! Real type
  using Real = typename real_type<Scalar>::type;
  //! Type of then underlying vectors
  using t_Vector = Vector<Scalar>;
  //! Type of the Ψ and Ψ^H operations, as well as Φ and Φ^H
  using t_LinearTransform = LinearTransform<t_Vector>;

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
  PowerMethod<SCALAR> &NAME(TYPE const &(NAME)) { \
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
  template <typename DERIVED>
  DiagnosticAndResult operator()(Eigen::DenseBase<DERIVED> const &A, t_Vector const &input) const;

  //! \brief Calls the power method for a given matrix-vector multiplication function
  DiagnosticAndResult operator()(OperatorFunction<t_Vector> const &op, t_Vector const &input) const;

 protected:
};

template <typename SCALAR>
typename PowerMethod<SCALAR>::DiagnosticAndResult PowerMethod<SCALAR>::AtA(
    t_LinearTransform const &A, t_Vector const &input) const {
  auto const op = [&A](t_Vector &out, t_Vector const &input) -> void {
    out = A.adjoint() * static_cast<t_Vector>(A * input);
  };
  return operator()(op, input);
}

template <typename SCALAR>
template <typename DERIVED>
typename PowerMethod<SCALAR>::DiagnosticAndResult PowerMethod<SCALAR>::operator()(
    Eigen::DenseBase<DERIVED> const &A, t_Vector const &input) const {
  Matrix<Scalar> const Ad = A.derived();
  auto const op = [&Ad](t_Vector &out, t_Vector const &input) -> void { out = Ad * input; };
  return operator()(op, input);
}

template <typename SCALAR>
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
} // namespace sopt::algorithm
#endif
