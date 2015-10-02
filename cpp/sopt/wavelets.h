#ifndef SOPT_WAVELETS_H
#define SOPT_WAVELETS_H

// Convenience header to include wavelets headers and additional utilities

#include "wavelets/wavelets.h"
#include "wavelets/sara.h"
#include "sopt/linear_transform.h"

namespace sopt {
  //! Creates linear transform from wavelet functor
  template<class T>
  LinearTransform<Vector<T>> linear_transform(wavelets::Wavelet const &wavelet) {
    return LinearTransform<Vector<T>>(
       [&wavelet](RefVector<T> out, ConstRefVector<T> const &x) {
         wavelet.direct(out.array(), x.array());
       },
       [&wavelet](RefVector<T> out, ConstRefVector<T> const &x) {
         wavelet.indirect(x.array(), out.array());
       }
    );
  }

  //! Creates linear transform from 2d wavelet functor
  template<class T>
  LinearTransform<Vector<T>> linear_transform(
      wavelets::Wavelet const &wavelet, t_uint rows, t_uint cols = 1) {
    if(rows == 1 or cols == 1)
      return linear_transform<T>(wavelet);
    return LinearTransform<Vector<T>>(
       [&wavelet, rows, cols](RefVector<T> out, ConstRefVector<T> const &x) {
         assert(x.size() == rows * cols);
         out.resize(x.size());
         auto const x_mat = Image<T>::Map(x.data(), rows, cols);
         auto out_mat = Image<T>::Map(out.data(), rows, cols);
         wavelet.indirect(x_mat, out_mat);
       },
       [&wavelet, rows, cols](RefVector<T> out, ConstRefVector<T> const &x) {
         assert(x.size() == rows * cols);
         out.resize(x.size());
         auto const x_mat = Image<T>::Map(x.data(), rows, cols);
         auto out_mat = Image<T>::Map(out.data(), rows, cols);
         wavelet.direct(out_mat, x_mat);
       }
    );
  }

  //! Creates linear transform from sara functor
  template<class T>
  LinearTransform<Vector<T>> linear_transform(wavelets::SARA const &wavelet) {
    return LinearTransform<Vector<T>>(
       [wavelet](RefVector<T> out, ConstRefVector<T> const &x) { wavelet.direct(out, x); },
       {{wavelet.size(), 1, 0}},
       [wavelet](RefVector<T> out, ConstRefVector<T> const &x) { wavelet.indirect(out, x); },
       {{1, wavelet.size(), 0}}
    );
  }
} /* sopt */

#endif
