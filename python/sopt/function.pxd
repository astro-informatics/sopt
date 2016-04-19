cimport cython
import cython
from libcpp.memory cimport shared_ptr

cdef extern from "sopt/types.h" namespace "sopt":
    cdef cppclass Vector[T]:
        Vector()
        Vector(int)
        T* data()
        int size()
        void resize(int)
        T& operator[](int)

    cdef cppclass Vector[T]:
        Vector()
        Vector(int)
        T* data()
        int size()
        void resize(int)
        T& operator[](int)

    cdef cppclass OperatorFunction[T]:
        OperatorFunction()
        void operator()(T &, T &)

cdef api void sopt_operator_function_callback(
    object self, Vector[double] &input, Vector[double] &output)

cdef void call_operator_function(OperatorFunction[Vector[double]]& op, double[::1] input,
                                 double [::1] output) except *

cdef extern from "sopt/pywrapper.h" namespace "sopt::python":
    cdef OperatorFunction[Vector[T]] wrap_operator_function[T](object func)

cdef extern from "sopt/cython_function_api.h":
    pass
