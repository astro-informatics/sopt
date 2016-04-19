from sopt.types cimport t_real, t_complex, t_uint
from libcpp cimport bool as cbool
cdef extern from "sopt/sdmm.h" namespace "sopt::algorithm":
    cdef cppclass cSDMM "sopt::algorithm::SDMM"[T]:
        cSDMM()
        t_uint itermax()
        cSDMM& itermax(t_uint)
        t_real gamma()
        cSDMM& gamma(t_real)


cdef class SDMM:
    cdef:
        cSDMM[t_real]* real_ptr
        cSDMM[t_complex]* complex_ptr
        readonly cbool is_real
