#ifndef SOPT_PYTHON_PYWRAPPER_H
#include <Python.h>
#include <memory>
#include "sopt/types.h"
#include "sopt/wrapper.h"
#include "sopt/cython_function_api.h"

namespace sopt {
namespace python {
//! Callback between python and C
template <class SCALAR> using CallBack = void (*)(PyObject *, SCALAR const *, SCALAR *);

// //! Creates a wrapper function from a python object
// template <class VECTOR>
// std::shared_ptr<sopt::details::WrapFunction<VECTOR>>
// wrap_callback_impl(PyObject *object, CallBack<typename VECTOR::Scalar> const &callback, int Nin,
//                    int Nout) {
//   auto const func = [object, callback, Nin, Nout](VECTOR &output, VECTOR const &input) {
//     if(input.size() != Nin)
//       throw std::out_of_range("Input vector does not have expected size");
//     output.resize(Nout);
//     callback(object, input.data(), output.data());
//   };
//   return std::make_shared<sopt::details::WrapFunction<VECTOR>>(
//       sopt::details::wrap<VECTOR>(func, {0, 1, Nout}));
// }
//
// typedef CallBack<double> CallBackDouble;
// typedef CallBack<float> CallBackFloat;

// inline std::shared_ptr<sopt::details::WrapFunction<Vector<double>>>
// wrap_callback(PyObject *object, void *const &callback, int Nin, int Nout) {
//   return wrap_callback_impl<Vector<double>>(object, (CallBack<double>)callback, Nin, Nout);
// }
// inline sopt::details::WrapFunction<Vector<float>>
// wrap_callback(PyObject *object, CallBackFloat callback, int Nin, int Nout) {
//   return wrap_callback_impl<Vector<float>>(object, callback, Nin, Nout);
// }


template <class SCALAR>
OperatorFunction<Vector<SCALAR>> wrap_operator_function(PyObject *self) {
  import_sopt__function();
  using namespace std::placeholders;
  auto const result = [self](Vector<SCALAR> &out, Vector<SCALAR> const &input) {
    sopt_operator_function_callback(self, const_cast<Vector<SCALAR>&>(input), out);
  };
  return result;
}
}
}
#endif
