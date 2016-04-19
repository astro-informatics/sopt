#ifndef SOPT_PYTHON_PYWRAPPER_H
#include <Python.h>
#include "sopt/cython_function_api.h"
#include "sopt/types.h"

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

ConvergenceFunction<t_real>
wrap_convfunc_real(bool (*ptrfunc)(PyObject *, Vector<t_real> &), PyObject *self) {
  using namespace std::placeholders;
  auto const result = [self, ptrfunc](Vector<t_real> const &input) {
    return (*ptrfunc)(self, const_cast<Vector<t_real> &>(input));
  };
  return result;
}

ConvergenceFunction<t_complex>
wrap_convfunc_complex(bool (*ptrfunc)(PyObject *, Vector<t_complex> &), PyObject *self) {
  using namespace std::placeholders;
  auto const result = [self, ptrfunc](Vector<t_complex> const &input) {
    return (*ptrfunc)(self, const_cast<Vector<t_complex> &>(input));
  };
  return result;
}
}
}
#endif
