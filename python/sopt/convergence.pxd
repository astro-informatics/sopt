from sopt.types cimport Vector, t_real, t_complex
from libcpp cimport bool as cbool

cdef extern from "sopt/types.h" namespace "sopt":
    cdef cppclass cConvergenceFunction "sopt::ConvergenceFunction"[T]:
        cConvergenceFunction()
        cbool operator()(Vector[T] &)
        cbool is_valid "operator bool"()

cdef class ConvergenceFunction:
    cdef:
        cConvergenceFunction[t_real] real_self
        cConvergenceFunction[t_complex] complex_self
        object function

    cpdef cbool _call_real(self, array) except *
    cpdef cbool _call_complex(self, array) except *
