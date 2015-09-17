import numpy as np
from cython cimport view
from libcpp.string cimport string

cdef extern from "pysdmm.h" namespace "sopt::pySDMM":
    void c_sdmm_solver[T](T* input, T* result, const int N) except+;


class solver:
    def __init__(self, itermax = None, gamma = None, proximal = None, 
                 Ln = None, cg_tolerance = 1e-12):
        self.config = {}
        self.paramlist = ['itermax', 'gamma', 'proximal', 'Ln', 'cg_tolerance']
        self.config['itermax'] = itermax
        self.config['gamma'] = gamma
        self.config['cg_tolerance'] = cg_tolerance
        self.config['proximal'] = proximal
        self.config['Ln'] = Ln
    
    def __setitem__(self, key, item):
        if key not in self.config:
            raise NameError(key, "is not a parameter of the SDMM solver")
        else:
            self.config[key] = item
       
    def print_config(self):
        print self.config



    def solve(self, input):
        N = input.size# need to be checked here
        result = np.zeros(N, dtype=input.dtype)
        cdef:
            long input_data = input.ctypes.data
            long result_data = result.ctypes.data
        c_sdmm_solver[complex](<double complex*>input_data, <double complex *>result_data, N)
#        if input.dtype == 'float64':
#            c_sdmm_solver[double](<double *>input_data, <double *>result_data, N)
#        elif input.dtype == 'complex128':

        print 'ok'
        return result
