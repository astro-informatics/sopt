#ifndef SOPT_WAVELETS_H
#define SOPT_WAVELETS_H

#include <iostream>
// Convenience header to include wavelets headers and additional utilities
#include "sopt/config.h"
#include "sopt/linear_transform.h"
#include "sopt/mpi/communicator.h"
#include "sopt/wavelets/sara.h"
#include "sopt/wavelets/wavelets.h"

namespace sopt {
namespace details {
namespace {
//! Thin linear-transform wrapper around some operator accepting direct and indirect
template <class T, class OP> LinearTransform<Vector<T>> linear_transform(OP const &op) {
  return LinearTransform<Vector<T>>(
      [&op](Vector<T> &out, Vector<T> const &x) { op.indirect(x.array(), out.array()); },
      [&op](Vector<T> &out, Vector<T> const &x) { op.direct(out.array(), x.array()); });
}
//! \brief Thin linear-transform wrapper around 2d wavelets
//! \details Goes back and forth between vector representations and image representations, where
//! images can be 2d.
//! \param[in] op: Wavelet operator
//! \param[in] rows: Number of rows in the image
//! \param[in] cols: Number of columns in the image
//! \param[in] factor: Allows for SARA transforms, i.e. more than one wavelet basis
template <class T, class OP>
LinearTransform<Vector<T>>
linear_transform(OP const &op, t_uint rows, t_uint cols, t_uint factor = 1) {
  if(rows == 1 or cols == 1)
    return linear_transform<T, OP>(op);
  return LinearTransform<Vector<T>>(
      [&op, rows, cols, factor](Vector<T> &out, Vector<T> const &x) {
        assert(static_cast<t_uint>(x.size()) == rows * cols * factor);
        out.resize(rows * cols);
        auto signal = Image<T>::Map(out.data(), rows, cols);
        auto const coeffs = Image<T>::Map(x.data(), rows, cols * factor);
        op.indirect(coeffs, signal);
      },
      {{0, 1, static_cast<t_int>(rows * cols)}},
      [&op, rows, cols, factor](Vector<T> &out, Vector<T> const &x) {
        assert(static_cast<t_uint>(x.size()) == rows * cols);
        out.resize(rows * cols * factor);
        auto const signal = Image<T>::Map(x.data(), rows, cols);
        auto coeffs = Image<T>::Map(out.data(), rows, cols * factor);
        op.direct(coeffs, signal);
      },
      {{0, 1, static_cast<t_int>(factor * rows * cols)}});
}
} // namespace
} // namespace details

namespace utilities {
//! return wavelet basis coefficients from a dictionary
template <class T>
Vector<T> &
get_wavelet_basis_coefficients(Vector<T> &coeffs, const t_uint basis_index, const t_uint size);
//! return wavelet basis coefficients for a given level and below (1d case)
template <class T>
Vector<T> &get_wavelet_levels_1d(Vector<T> &coeffs, const t_uint level, const t_uint size);
//! return wavelet basis coefficients for a given level and below (2d case)
template <class T>
Vector<T> &
get_wavelet_levels(Vector<T> &coeffs, const t_uint level, const t_uint rows, const t_uint cols);
//! return wavelet basis coefficients low pass (rows) and high pass (cols) for a given level
template <class T>
Vector<T> &get_wavelet_low_high_pass(Vector<T> &coeffs, const t_uint level, const t_uint rows,
                                     const t_uint cols);
//! return wavelet basis coefficients high pass (rows) and high pass (cols) for a given level
template <class T>
Vector<T> &get_wavelet_high_high_pass(Vector<T> &coeffs, const t_uint level, const t_uint rows,
                                      const t_uint cols);
//! return wavelet basis coefficients high pass (rows) and high pass (cols) for a given level
template <class T>
Vector<T> &get_wavelet_high_low_pass(Vector<T> &coeffs, const t_uint level, const t_uint rows,
                                     const t_uint cols);
//! return wavelet basis coefficients high pass (rows) and high pass (cols) for a given level
template <class T>
Vector<T> &get_wavelet_low_low_pass(Vector<T> &coeffs, const t_uint level, const t_uint rows,
                                    const t_uint cols);
//! return 1d high pass filter for a given level of a wavelet
template <class T>
Vector<T> &get_wavelet_high_pass_1d(Vector<T> &coeffs, const t_uint level, const t_uint size);
// macro to add version to work with a wavelet dictionary
#define SOPT_WAVELET_MACRO(NAME)                                                                   \
  template <class T>                                                                               \
  Vector<T> &NAME(Vector<T> &coeffs, const t_uint basis_index, const t_uint level,                 \
                  const t_uint rows, const t_uint cols);                                           \
  template <class T>                                                                               \
  Vector<T> &NAME(Vector<T> &coeffs, const t_uint basis_index, const t_uint level,                 \
                  const t_uint rows, const t_uint cols) {                                          \
    return NAME(get_wavelet_basis_coefficients(coeffs, basis_index, coeffs.size()), level, rows,   \
                cols);                                                                             \
  };
SOPT_WAVELET_MACRO(get_wavelet_levels)
SOPT_WAVELET_MACRO(get_wavelet_low_high_pass)
SOPT_WAVELET_MACRO(get_wavelet_high_high_pass)
SOPT_WAVELET_MACRO(get_wavelet_high_low_pass)
SOPT_WAVELET_MACRO(get_wavelet_low_low_pass)
#undef SOPT_WAVELET_MACRO
// implimentations
template <class T>
Vector<T> &
get_wavelet_basis_coefficients(Vector<T> &coeffs, const t_uint basis_index, const t_uint size) {
  assert(coeffs.size() > basis_index * size);
  return coeffs.segment(basis_index * size, size);
}
template <class T>
Vector<T> &get_wavelet_levels_1d(Vector<T> &coeffs, const t_uint level, const t_uint size) {

  auto const N = static_cast<t_uint>(coeffs.size()) >> level; // bitshift to divide by 2^level
  return coeffs.head(N);
}
template <class T>
Vector<T> &get_wavelet_high_pass_1d(Vector<T> &coeffs, const t_uint level, const t_uint size) {
  auto const N = static_cast<t_uint>(coeffs.size()) >> level; // bitshift to divide by 2^level
  return get_wavelet_levels(coeffs, level, size).tail(N / 2);
}
template <class T>
Vector<T> &
get_wavelet_levels(Vector<T> &coeffs, const t_uint level, const t_uint rows, const t_uint cols) {
  const Matrix<T> signal = Matrix<T>::Map(coeffs.data(), rows, cols);
  auto const Nx = static_cast<t_uint>(signal.rows()) >> level; // bitshift to divide by 2^level
  auto const Ny = static_cast<t_uint>(signal.cols()) >> level;
  return Vector<T>::Map(signal.topLeftCorner(Nx, Ny).data(), Nx * Ny);
}
template <class T>
Vector<T> &get_wavelet_low_high_pass(Vector<T> &coeffs, const t_uint level, const t_uint rows,
                                     const t_uint cols) {
  auto const Nx = rows >> level; // bitshift to divide by 2^level
  auto const Ny = cols >> level;
  const Matrix<T> signal
      = Matrix<T>::Map(get_wavelet_levels(coeffs, level, rows, cols).data(), Nx, Ny);
  return Vector<T>::Map(signal.topRightCorner(signal.rows() / 2, signal.cols() / 2).data(),
                        signal.size() / 4);
}
template <class T>
Vector<T> &get_wavelet_high_high_pass(Vector<T> &coeffs, const t_uint level, const t_uint rows,
                                      const t_uint cols) {
  auto const Nx = rows >> level; // bitshift to divide by 2^level
  auto const Ny = cols >> level;
  const Matrix<T> signal
      = Matrix<T>::Map(get_wavelet_levels(coeffs, level, rows, cols).data(), Nx, Ny);
  return Vector<T>::Map(signal.bottomRightCorner(signal.rows() / 2, signal.cols() / 2).data(),
                        signal.size() / 4);
}
template <class T>
Vector<T> &get_wavelet_high_low_pass(Vector<T> &coeffs, const t_uint level, const t_uint rows,
                                     const t_uint cols) {
  auto const Nx = rows >> level; // bitshift to divide by 2^level
  auto const Ny = cols >> level;
  const Matrix<T> signal
      = Matrix<T>::Map(get_wavelet_levels(coeffs, level, rows, cols).data(), Nx, Ny);
  return Vector<T>::Map(signal.bottomLeftCorner(signal.rows() / 2, signal.cols() / 2).data(),
                        signal.size() / 4);
}
template <class T>
Vector<T> &get_wavelet_low_low_pass(Vector<T> &coeffs, const t_uint level, const t_uint rows,
                                    const t_uint cols) {
  auto const Nx = rows >> level; // bitshift to divide by 2^level
  auto const Ny = cols >> level;
  const Matrix<T> signal
      = Matrix<T>::Map(get_wavelet_levels(coeffs, level, rows, cols).data(), Nx, Ny);
  return Vector<T>::Map(signal.topLeftCorner(signal.rows() / 2, signal.cols() / 2).data(),
                        signal.size() / 4);
}

} // namespace utilities

//! \brief Thin linear-transform wrapper around 1d wavelets
//! \warning Because of the way Purify defines things, Ψ^T is
//! actually the transform from signal to coefficients.
template <class T> LinearTransform<Vector<T>> linear_transform(wavelets::Wavelet const &wavelet) {
  return details::linear_transform<T, wavelets::Wavelet>(wavelet);
}

//! \brief Thin linear-transform wrapper around 1d sara operator
//! \note Because of the way Purify defines things, Ψ^T is
//! actually the transform from signal to coefficients.
template <class T> LinearTransform<Vector<T>> linear_transform(wavelets::SARA const &sara) {
  return details::linear_transform<T, wavelets::SARA>(sara);
}

//! \brief Thin linear-transform wrapper around 2d wavelets
//! \note Because of the way Purify defines things, Ψ^T is
//! actually the transform from signal to coefficients.
template <class T>
LinearTransform<Vector<T>>
linear_transform(wavelets::Wavelet const &wavelet, t_uint rows, t_uint cols = 1) {
  return details::linear_transform<T, wavelets::Wavelet>(wavelet, rows, cols);
}
//! \brief Thin linear-transform wrapper around 2d wavelets
//! \param[in] sara: SARA wavelet dictionary
//! \param[in] rows: Number of rows in the image
//! \param[in] cols: Number of columns in the image
//! \note Because of the way Purify defines things, Ψ^T is actually the transform from signal to
//! coefficients.
template <class T>
LinearTransform<Vector<T>>
linear_transform(wavelets::SARA const &sara, t_uint rows, t_uint cols = 1) {
  return details::linear_transform<T, wavelets::SARA>(sara, rows, cols, sara.size());
}
#ifdef SOPT_MPI
template <class T>
LinearTransform<Vector<T>> linear_transform(wavelets::SARA const &sara, t_uint rows, t_uint cols,
                                            sopt::mpi::Communicator const &comm) {
  auto const factor = sara.size();
  auto const normalization = std::sqrt(sara.size()) / std::sqrt(comm.all_sum_all(sara.size()));
  return LinearTransform<Vector<T>>(
      [&sara, rows, cols, factor, comm, normalization](Vector<T> &out, Vector<T> const &x) {
        assert(static_cast<t_uint>(x.size()) == rows * cols * factor);
        out.resize(rows * cols);
        if(sara.size() == 0)
          out.fill(0);
        else {
          auto signal = Image<T>::Map(out.data(), rows, cols);
          auto const coeffs = Image<T>::Map(x.data(), rows, cols * factor);
          sara.indirect(coeffs, signal);
          out *= normalization;
        }
        comm.all_sum_all(out);
      },
      {{0, 1, static_cast<t_int>(rows * cols)}},
      [&sara, rows, cols, factor, normalization](Vector<T> &out, Vector<T> const &x) {
        assert(static_cast<t_uint>(x.size()) == rows * cols);
        out.resize(rows * cols * factor);
        auto const signal = Image<T>::Map(x.data(), rows, cols);
        auto coeffs = Image<T>::Map(out.data(), rows, cols * factor);
        sara.direct(coeffs, signal);
        out *= normalization;
      },
      {{0, 1, static_cast<t_int>(factor * rows * cols)}});
}
#endif

} // namespace sopt

#endif
