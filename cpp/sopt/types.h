#ifndef BICO_TRAITS_H
#define BICO_TRAITS_H

#include "sopt/config.h"
#include <complex>
#include <functional>
#include <Eigen/Core>
#include "sopt/real_type.h"

namespace sopt {

//! Root of the type hierarchy for signed integers
using t_int = int;
//! Root of the type hierarchy for unsigned integers
using t_uint = size_t;
//! Root of the type hierarchy for real numbers
using t_real = double;
//! Root of the type hierarchy for (real) complex numbers
using t_complex = std::complex<t_real>;

//! \brief A vector of a given type
//! \details Operates as mathematical vector.
template <typename T = t_real>
using Vector = Eigen::Matrix<T, Eigen::Dynamic, 1>;

//! \brief A matrix of a given type
//! \details Operates as mathematical matrix.
template <typename T = t_real>
using Matrix = Eigen::Matrix<T, Eigen::Dynamic, Eigen::Dynamic>;

//! \brief A 1-dimensional list of elements of given type
//! \details Operates coefficient-wise, not matrix-vector-wise
template <typename T = t_real>
using Array = Eigen::Array<T, Eigen::Dynamic, 1>;

//! \brief A 2-dimensional list of elements of given type
//! \details Operates coefficient-wise, not matrix-vector-wise
template <typename T = t_real>
using Image = Eigen::Array<T, Eigen::Dynamic, Eigen::Dynamic>;

//! Typical function out = A*x
template <typename VECTOR = Vector<>>
using OperatorFunction = std::function<void(VECTOR &, VECTOR const &)>;

//! Typical function signature for calls to proximal
template <typename SCALAR = t_real>
using ProximalFunction =
    std::function<void(Vector<SCALAR> &output, typename real_type<SCALAR>::type const weight, Vector<SCALAR> const &input)>;

//! Typical function signature for convergence
template <typename SCALAR = t_real>
using ConvergenceFunction = std::function<bool(Vector<SCALAR> const &)>;
}  // namespace sopt
#endif
