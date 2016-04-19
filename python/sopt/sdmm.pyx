cimport sopt.sdmm
from sopt.convergence cimport ConvergenceFunction
from sopt.convergence import ConvergenceFunction
from sopt.types cimport t_uint

cdef class SDMM:
    def __cinit__(self):
        self.convergence_function = ConvergenceFunction()

    def __init__(self, real=True, **kwargs):
        for key, value in kwargs:
            setattr(self, key, value)

    property itermax:
        """ Maximum number of iterations

            Defaults to maximum allowed for the underlying c++ type

        """

        def __get__(self):
            return self.real_self.itermax()
        def __set__(self, value):
            self.real_self.itermax(value)
            self.complex_self.itermax(value)

    property gamma:
        """ Gamma """

        def __get__(self):
            return self.real_self.gamma()
        def __set__(self, value):
            self.real_self.gamma(value)
            self.complex_self.gamma(value)

    property convergence:
        """ User specified convergence function

            It can be any function taking an array of real and complex values and returning a bool.
            At each iteration, this function is called with the current solution. If it returns
            True, then SDMM is deemed converged.

        """
        def __get__(self):
            return self.convergence_function
        def __set__(self, function):
            self.convergence_function = ConvergenceFunction(function)
