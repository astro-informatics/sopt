cimport sopt.types
cimport sopt.convergence
ctypedef cbool(*CallBackReal)(object, Vector[t_real] &)
ctypedef cbool(*CallBackComplex)(object, Vector[t_complex] &)


cdef cbool real_convfunc_to_python(object self, Vector[t_real] &input):
    """ Makes a call to a python function from C++

        Maps Vector[real] to numpy array

    """
    from numpy import frombuffer
    cdef:
        int Nin = input.size()
        t_real[::1] pyinput = <t_real[:Nin:1]> input.data()

    return self(frombuffer(pyinput, dtype="double"))


cdef cbool complex_convfunc_to_python(object self, Vector[t_complex] &input):
    """ Makes a call to a python function from C++

        Maps Vector[complex] to numpy array

    """
    from numpy import frombuffer
    cdef:
        int Nin = input.size()
        double complex* data = <double complex*> input.data()
        double complex[::1] pyinput = <double complex[:Nin:1]> data

    return self(frombuffer(pyinput, dtype="complex128"))


cdef extern from "sopt/pywrapper.h" namespace "sopt::python":
    cdef:
        cConvergenceFunction[t_real] wrap_convfunc_real(CallBackReal ptrfunc, object func)
        cConvergenceFunction[t_complex] wrap_convfunc_complex(CallBackComplex ptrfunc, object func)


cdef class ConvergenceFunction:
    def __cinit__(self, function=None):
        self.function = function if function is not None else lambda x: False
        self.real_self = wrap_convfunc_real(real_convfunc_to_python, self.function)
        self.complex_self = wrap_convfunc_complex(complex_convfunc_to_python, self.function)

    def __call__(self, array, gothroughC=False):
        """ True if convergence has been achieved

            Generally, the functor will call the python function directly. However, it is possible
            force going through C++ if `gothroughC` is True.

        """
        from numpy import isrealobj
        if self.function is not None and gothroughC == False:
            return self.function(array)
        elif isrealobj(array):
            return self._call_real(array)
        else:
            return self._call_complex(array)

    cpdef cbool _call_real(self, array) except *:
        """ Calls c++ function with array

            Will create a copy of array as a Vector[real]

        """
        assert self.real_self.is_valid()
        cdef Vector[t_real] carray
        carray.resize(len(array))

        for i in range(len(array)):
            carray[i] = array[i]

        return self.real_self(carray)

    cpdef cbool _call_complex(self, array) except *:
        """ Calls c++ function with array

            Will create a copy of array as a Vector[complex]

        """
        assert self.complex_self.is_valid()
        cdef:
            double complex value
            Vector[t_complex] carray

        carray.resize(len(array))

        for i in range(len(array)):
            value = array[i]
            carray[i].real(value.real)
            carray[i].imag(value.imag)

        return self.complex_self(carray)
