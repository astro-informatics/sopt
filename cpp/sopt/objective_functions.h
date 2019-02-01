#ifndef SOPT_OBJECTIVE_FUNCTION_H
#define SOPT_OBJECTIVE_FUNCTION_H
#include "sopt/config.h"
#include <functional>
#include <type_traits>
#include "sopt/exception.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/maths.h"
#include "sopt/types.h"

namespace sopt {
namespace objective_functions {
//! returns g(x) + ||y - Φ x||_2^2 as a function
template <class T>
std::function<t_real(T)> const unconstrained_regularisation(
    const std::function<t_real(T)> &g, const t_real &sig, const T &y,
    const sopt::OperatorFunction<T> &measurement_operator);
//! returns ||ψ^t x||_1 + ||y - Φ x||_2^2 as a function
template <class T>
std::function<t_real(T)> const unconstrained_L1_regularisation(
    const t_real &gamma, const t_real &sig, const T &y,
    const sopt::OperatorFunction<T> &measurement_operator,
    const sopt::LinearTransform<T> &wavelet_operator);
template <class T>
std::function<t_real(T)> const unconstrained_regularisation(
    const std::function<t_real(T)> &g, const t_real &sig, const T &y,
    const sopt::LinearTransform<T> &measurement_operator);
template <class T>
std::function<t_real(T)> const unconstrained_l1_regularisation(
    const t_real &gamma, const t_real &sig, const T &y,
    const sopt::LinearTransform<T> &measurement_operator,
    const sopt::LinearTransform<T> &wavelet_operator);
}  // namespace objective_functions
}  // namespace sopt
namespace sopt {
namespace objective_functions {

template <class T>
std::function<t_real(T)> const unconstrained_regularisation(
    const std::function<t_real(T)> &g, const t_real &sig, const T &y,
    const sopt::LinearTransform<T> &measurement_operator) {
  return [=](const T &x) -> t_real {
    return g(x) + 0.5 * std::pow(sopt::l2_norm(y - measurement_operator * x) / sig, 2);
  };
}
template <class T>
std::function<t_real(T)> const unconstrained_l1_regularisation(
    const t_real &gamma, const t_real &sig, const T &y,
    const sopt::LinearTransform<T> &measurement_operator,
    const sopt::LinearTransform<T> &wavelet_operator) {
  if (gamma <= 0) SOPT_THROW("regularsiation paramter is not greater than 0.");
  const std::function<t_real(T)> g = [=](const T &x) -> t_real {
    return sopt::l1_norm(wavelet_operator.adjoint() * x) * gamma;
  };
  return unconstrained_regularisation<T>(g, sig, y, measurement_operator);
}
template <class T>
std::function<t_real(T)> const unconstrained_regularisation(
    const std::function<t_real(T)> &g, const t_real &sig, const T &y,
    const sopt::OperatorFunction<T> &measurement_operator) {
  const LinearTransform<T> mop = {measurement_operator, measurement_operator};
  return unconstrained_regularisation<T>(g, sig, mop * y, mop);
}
template <class T>
std::function<t_real(T)> const unconstrained_l1_regularisation(
    const t_real &gamma, const t_real &sig, const T &y,
    const sopt::OperatorFunction<T> &measurement_operator,
    const sopt::LinearTransform<T> &wavelet_operator) {
  const LinearTransform<T> mop = {measurement_operator, measurement_operator};
  return unconstrained_l1_regularisation<T>(gamma, sig, mop * y, mop, wavelet_operator);
}
}  // namespace objective_functions
}  // namespace sopt
#endif
