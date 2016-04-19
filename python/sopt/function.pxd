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

    cdef cppclass OperatorFunction[T]:
        OperatorFunction()
        void operator()(T &, T &)

cdef void double_opfunc_to_python(object self, Vector[double] &input, Vector[double] &output)

ctypedef void(*CallBackDouble)(object, Vector[double] &, Vector[double] &)
""" Function pointer passed on to OperatorFunction to call python """

cdef extern from "sopt/pywrapper.h" namespace "sopt::python":
    cdef OperatorFunction[Vector[double]] wrap_operator_function_double(
                    CallBackDouble ptrfunc, object func)
