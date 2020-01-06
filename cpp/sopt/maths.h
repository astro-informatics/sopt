#ifndef SOPT_MATHS_H
#define SOPT_MATHS_H

#include "sopt/config.h"
#include <algorithm>
#include <complex>
#include <type_traits>
#include <Eigen/Core>
#include "sopt/exception.h"
#include "sopt/types.h"

namespace sopt {

//! Computes the standard deviation of a vector
template <class T>
typename real_type<typename T::Scalar>::type standard_deviation(Eigen::ArrayBase<T> const &x) {
  return (x - x.mean()).matrix().stableNorm() / std::sqrt(x.size());
}
//! Computes the standard deviation of a vector
template <class T>
typename real_type<typename T::Scalar>::type standard_deviation(Eigen::MatrixBase<T> const &x) {
  return standard_deviation(x.array());
}

//! abs(x) < threshhold ? 0: x - sgn(x) * threshhold
template <class SCALAR>
typename std::enable_if<std::is_arithmetic<SCALAR>::value or is_complex<SCALAR>::value,
                        SCALAR>::type
soft_threshhold(SCALAR const &x, typename real_type<SCALAR>::type const &threshhold) {
  auto const normalized = std::abs(x);
  return normalized < threshhold ? SCALAR(0) : (x * (SCALAR(1) - threshhold / normalized));
}

namespace details {
//! Expression to create projection onto positive orthant
template <class SCALAR>
class ProjectPositiveQuadrant {
 public:
  SCALAR operator()(const SCALAR &value) const { return std::max(value, SCALAR(0)); }
};
//! Specialization for complex numbers
template <class SCALAR>
class ProjectPositiveQuadrant<std::complex<SCALAR>> {
 public:
  SCALAR operator()(SCALAR const &value) const { return std::max(value, SCALAR(0)); }
  std::complex<SCALAR> operator()(std::complex<SCALAR> const &value) const {
    return {operator()(value.real()), SCALAR(0)};
  }
};

//! Helper template typedef to instantiate soft_threshhold that takes an Eigen object
template <class SCALAR>
using SoftThreshhold = decltype(
    std::bind(soft_threshhold<SCALAR>, std::placeholders::_1, typename real_type<SCALAR>::type(1)));
}  // namespace details

//! Expression to create projection onto positive quadrant
template <class T>
Eigen::CwiseUnaryOp<const details::ProjectPositiveQuadrant<typename T::Scalar>, const T>
positive_quadrant(Eigen::DenseBase<T> const &input) {
  typedef details::ProjectPositiveQuadrant<typename T::Scalar> Projector;
  typedef Eigen::CwiseUnaryOp<const Projector, const T> UnaryOp;
  return UnaryOp(input.derived(), Projector());
}

//! Expression to create soft-threshhold
template <class T>
Eigen::CwiseUnaryOp<const details::SoftThreshhold<typename T::Scalar>, const T> soft_threshhold(
    Eigen::DenseBase<T> const &input,
    typename real_type<typename T::Scalar>::type const &threshhold) {
  typedef typename T::Scalar Scalar;
  typedef typename real_type<Scalar>::type Real;
  return Eigen::CwiseUnaryOp<const details::SoftThreshhold<typename T::Scalar>, const T>{
      input.derived(), std::bind(soft_threshhold<Scalar>, std::placeholders::_1, Real(threshhold))};
}

//! \brief Expression to create soft-threshhold with multiple parameters
//! \details Operates over a vector of threshholds: ``out(i) = soft_threshhold(x(i), h(i))``
//! Threshhold and input vectors must have the same size and type. The latter condition is enforced
//! by CwiseBinaryOp, unfortunately.
template <class T0, class T1>
typename std::enable_if<std::is_arithmetic<typename T0::Scalar>::value and
                            std::is_arithmetic<typename T1::Scalar>::value,
                        Eigen::CwiseBinaryOp<typename T0::Scalar (*)(typename T0::Scalar const &,
                                                                     typename T1::Scalar const &),
                                             const T0, const T1>>::type
soft_threshhold(Eigen::DenseBase<T0> const &input, Eigen::DenseBase<T1> const &threshhold) {
  if (input.size() != threshhold.size())
    SOPT_THROW("Threshhold and input should have the same size");
  return {input.derived(), threshhold.derived(), soft_threshhold<typename T0::Scalar>};
}

//! \brief Expression to create soft-threshhold with multiple parameters
//! \details Operates over a vector of threshholds: ``out(i) = soft_threshhold(x(i), h(i))``
//! Threshhold and input vectors must have the same size and type. The latter condition is enforced
//! by CwiseBinaryOp, unfortunately. So we cast threshhold from real to complex and back.
template <class T0, class T1>
typename std::enable_if<
    is_complex<typename T0::Scalar>::value and std::is_arithmetic<typename T1::Scalar>::value,
    Eigen::CwiseBinaryOp<
        typename T0::Scalar (*)(typename T0::Scalar const &, typename T0::Scalar const &), const T0,
        decltype(std::declval<const T1>().template cast<typename T0::Scalar>())>>::type
soft_threshhold(Eigen::DenseBase<T0> const &input, Eigen::DenseBase<T1> const &threshhold) {
  if (input.size() != threshhold.size())
    SOPT_THROW("Threshhold and input should have the same size: ")
        << threshhold.size() << " vs " << input.size();
  typedef typename T0::Scalar Complex;
  auto const func = [](Complex const &x, Complex const &t) -> Complex {
    return soft_threshhold(x, t.real());
  };
  return {input.derived(), threshhold.derived().template cast<Complex>(), func};
}

//! Computes weighted L1 norm
template <class T0, class T1>
typename real_type<typename T0::Scalar>::type l1_norm(Eigen::ArrayBase<T0> const &input,
                                                      Eigen::ArrayBase<T1> const &weights) {
  if (weights.size() == 1) return input.cwiseAbs().sum() * std::abs(weights(0));
  return (input.cwiseAbs() * weights).real().sum();
}
//! Computes weighted L1 norm
template <class T0, class T1>
typename real_type<typename T0::Scalar>::type l1_norm(Eigen::MatrixBase<T0> const &input,
                                                      Eigen::MatrixBase<T1> const &weight) {
  return l1_norm(input.array(), weight.array());
}
//! Computes L1 norm
template <class T0>
typename real_type<typename T0::Scalar>::type l1_norm(Eigen::ArrayBase<T0> const &input) {
  return input.cwiseAbs().sum();
}
//! Computes L1 norm
template <class T0>
typename real_type<typename T0::Scalar>::type l1_norm(Eigen::MatrixBase<T0> const &input) {
  return l1_norm(input.array());
}

//! Computes weighted L2 norm
template <class T0, class T1>
typename real_type<typename T0::Scalar>::type l2_norm(Eigen::ArrayBase<T0> const &input,
                                                      Eigen::ArrayBase<T1> const &weights) {
  if (weights.size() == 1) return input.matrix().eval().stableNorm() * std::abs(weights(0));
  return (input * weights).matrix().eval().stableNorm();
}
//! Computes weighted L2 norm
template <class T0, class T1>
typename real_type<typename T0::Scalar>::type l2_norm(Eigen::MatrixBase<T0> const &input,
                                                      Eigen::MatrixBase<T1> const &weights) {
  return l2_norm(input.derived().array(), weights.derived().array());
}
//! Computes weighted L2 norm
template <class T0>
typename real_type<typename T0::Scalar>::type l2_norm(Eigen::ArrayBase<T0> const &input) {
  typename T0::PlainObject w(1);
  w(0) = 1;
  return l2_norm(input, w);
}
//! Computes weighted L2 norm
template <class T0>
typename real_type<typename T0::Scalar>::type l2_norm(Eigen::MatrixBase<T0> const &input) {
  typename T0::PlainObject w(1);
  w(0) = 1;
  return l2_norm(input.derived().array(), w.array());
}

//! Computes weighted TV norm
template <class T0, class T1>
typename real_type<typename T0::Scalar>::type tv_norm(Eigen::ArrayBase<T0> const &input,
                                                      Eigen::ArrayBase<T1> const &weights) {
  const auto size = input.size() / 2;
  if (weights.size() == 1) return (input.segment(0, size).square() 
      + input.segment(size, size).square()).cwiseAbs().sqrt().matrix().eval().sum() * std::abs(weights(0));
  return std::abs(((input.segment(0, size).square() + input.segment(size, size).square()).cwiseAbs().sqrt() * weights).matrix().eval().sum());
}
//! Computes weighted TV norm
template <class T0, class T1>
typename real_type<typename T0::Scalar>::type tv_norm(Eigen::MatrixBase<T0> const &input,
                                                      Eigen::MatrixBase<T1> const &weights) {
  return tv_norm(input.derived().array(), weights.derived().array());
}
//! Computes weighted tv norm
template <class T0>
typename real_type<typename T0::Scalar>::type tv_norm(Eigen::ArrayBase<T0> const &input) {
  typename T0::PlainObject w(1);
  w(0) = 1;
  return tv_norm(input, w);
}
//! Computes weighted TV norm
template <class T0>
typename real_type<typename T0::Scalar>::type tv_norm(Eigen::MatrixBase<T0> const &input) {
  typename T0::PlainObject w(1);
  w(0) = 1;
  return tv_norm(input.derived().array(), w.array());
}

namespace details {
//! Greatest common divisor
inline t_int gcd(t_int a, t_int b) { return b == 0 ? a : gcd(b, a % b); }
}  // namespace details
}  // namespace sopt
#endif
