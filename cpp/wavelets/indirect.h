#ifndef SOPT_WAVELET_INDIRECT_H
#define SOPT_WAVELET_INDIRECT_H

#include "innards.impl.h"
#include "wavelet_data.h"
#include "sopt/types.h"

// Function inside anonymouns namespace won't appear in library
namespace sopt { namespace wavelets {
namespace {
  //! Single-level 1d indirect transform
  //! \param[in] coeffs_: input coefficients
  //! \param[out] signal: output with the reconstituted signal
  //! \param[in] wavelet: contains wavelet coefficients
  template<class T0, class T1>
    typename std::enable_if<T1::IsVectorAtCompileTime, void>::type
    indirect_transform_impl(
        Eigen::ArrayBase<T0> const & coeffs,
        Eigen::ArrayBase<T1> const & signal_, WaveletData const &wavelet
    ) {
      Eigen::ArrayBase<T1> & signal = const_cast< Eigen::ArrayBase<T1>& >(signal_);

      assert(coeffs.size() == signal.size());
      assert(coeffs.size() % 2 == 0);

      up_convolve_sum(
          signal, coeffs,
          wavelet.indirect_filter.low_even, wavelet.indirect_filter.low_odd,
          wavelet.indirect_filter.high_even, wavelet.indirect_filter.high_odd
      );
    }
  //! Single-level 2d indirect transform
  //! \param[in] coeffs_: input coefficients
  //! \param[out] signal: output with the reconstituted signal
  //! \param[in] wavelet: contains wavelet coefficients
  template<class T0, class T1>
    typename std::enable_if<not T1::IsVectorAtCompileTime, void>::type
    indirect_transform_impl(
        Eigen::ArrayBase<T0> const & coeffs_,
        Eigen::ArrayBase<T1> const & signal_, WaveletData const &wavelet
    ) {
      Eigen::ArrayBase<T0> & coeffs = const_cast< Eigen::ArrayBase<T0>& >(coeffs_);
      Eigen::ArrayBase<T1> & signal = const_cast< Eigen::ArrayBase<T1>& >(signal_);
      assert(coeffs.rows() == signal.rows() and coeffs.cols() == signal.cols());
      assert(coeffs.rows() % 2 == 0 and coeffs.cols() % 2 == 0);

      for(typename T0::Index i(0); i < signal.rows(); ++i)
        indirect_transform_impl(coeffs.row(i).transpose(), signal.row(i).transpose(), wavelet);
      coeffs = signal;
      for(typename T0::Index j(0); j < signal.cols(); ++j)
        indirect_transform_impl(coeffs.col(j), signal.col(j), wavelet);
    }
}

//! \brief N-levels 1d indirect transform
//! \param[in] coeffs_: input coefficients
//! \param[out] signal: output with the reconstituted signal
//! \param[in] wavelet: contains wavelet coefficients
//! \note The size  of the coefficients should a multiple of $2^l$ where $l$ is the number of
//! levels.
template<class T0, class T1>
  typename std::enable_if<T1::IsVectorAtCompileTime, void>::type
  indirect_transform(
      Eigen::ArrayBase<T0> const & coeffs,
      Eigen::ArrayBase<T1> & signal,
      t_uint levels, WaveletData const &wavelet
  ) {
    if(levels == 0) return;
    assert(coeffs.rows() == signal.rows());
    assert(coeffs.cols() == signal.cols());
    assert(coeffs.size() % (1u << levels) == 0);

    auto input = copy(coeffs);
    for(t_uint level(levels - 1); level > 0; --level) {
      auto const N = static_cast<t_uint>(signal.size()) >> level;
      indirect_transform_impl(input.head(N), signal.head(N), wavelet);
      input.head(N) = signal.head(N);
    }
    indirect_transform_impl(input, signal, wavelet);
  }

//! \brief N-levels 2d indirect transform
//! \param[in] coeffs_: input coefficients
//! \param[out] signal: output with the reconstituted signal
//! \param[in] wavelet: contains wavelet coefficients
//! \note The size  of the signal and coefficients should a multiple of $2^l$ where $l$ is the
//! number of levels.
template<class T0, class T1>
  typename std::enable_if<not T1::IsVectorAtCompileTime, void>::type
  indirect_transform(
      Eigen::ArrayBase<T0> const & coeffs_,
      Eigen::ArrayBase<T1> const & signal_,
      t_uint levels, WaveletData const &wavelet
  ) {
    if(levels == 0) return;
    Eigen::ArrayBase<T0> & coeffs = const_cast< Eigen::ArrayBase<T0>& >(coeffs_);
    Eigen::ArrayBase<T1> & signal = const_cast< Eigen::ArrayBase<T1>& >(signal_);
    assert(coeffs.rows() == signal.rows());
    assert(coeffs.cols() == signal.cols());
    assert(coeffs.size() % (1u << levels) == 0);

    auto input = copy(coeffs);
    for(t_uint level(levels - 1); level > 0; --level) {
      auto const Nx = static_cast<t_uint>(signal.rows()) >> level;
      auto const Ny = static_cast<t_uint>(signal.cols()) >> level;
      indirect_transform_impl(input.topLeftCorner(Nx, Ny), signal.topLeftCorner(Nx, Ny), wavelet);
      input.topLeftCorner(Nx, Ny) = signal.topLeftCorner(Nx, Ny);
    }
    indirect_transform_impl(input, signal, wavelet);
  }

//! Indirect 1d and 2d transform
//! \param[in] coeffs_: input coefficients
//! \param[in] wavelet: contains wavelet coefficients
//! \returns the reconstituted signal
//! \note The size  of the coefficients should a multiple of $2^l$ where $l$ is the number of
//! levels.
template<class T0>
  auto indirect_transform(
        Eigen::ArrayBase<T0> const &coeffs, t_uint levels, WaveletData const& wavelet
  ) -> decltype(copy(coeffs)) {
    auto result = copy(coeffs);
    indirect_transform(coeffs, result, levels, wavelet);
    return result;
  }
}}
#endif
