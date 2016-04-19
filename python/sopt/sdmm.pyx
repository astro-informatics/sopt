cimport sopt.sdmm
from sopt.types cimport t_uint

cdef class SDMM:
    def __cinit__(self, real=True):
        self.is_real = real
        if real:
            self.real_ptr = new cSDMM[t_real]()
        else:
            self.complex_ptr = new cSDMM[t_complex]()

    property itermax:
        """ Maximum number of iterations

            Defaults to maximum allowed for the underlying c++ type
        """

        def __get__(self):
            return self.real_ptr.itermax() if self.is_real else self.complex_ptr.itermax()
        def __set__(self, value):
            if self.is_real:
                self.real_ptr.itermax(value)
            else:
                self.complex_ptr.itermax(value)


    property gamma:
        """ Gamma """

        def __get__(self):
            return self.real_ptr.gamma() if self.is_real else self.complex_ptr.gamma()
        def __set__(self, value):
            if self.is_real:
                self.real_ptr.gamma(value)
            else:
                self.complex_ptr.gamma(value)

