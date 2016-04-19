#ifndef SOPT_PYTHON_PYWRAPPER_H
#include <Python.h>
#include <memory>
#include "sopt/cython_function_api.h"
#include "sopt/types.h"
#include "sopt/wrapper.h"

namespace sopt {
namespace python {
//! Callback between python and C
template <class SCALAR> using CallBack = void (*)(PyObject *, Vector<SCALAR> &, Vector<SCALAR> &);
typedef CallBack<double> CallBackDouble;
typedef CallBack<float> CallBackFloat;

OperatorFunction<Vector<double>>
wrap_operator_function_double(CallBackDouble ptrfunc, PyObject *self) {
  using namespace std::placeholders;
  auto const result = [self, ptrfunc](Vector<double> &out, Vector<double> const &input) {
    (*ptrfunc)(self, const_cast<Vector<double> &>(input), out);
  };
  return result;
}
}
}
#endif
