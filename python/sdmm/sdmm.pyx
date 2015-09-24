import numpy as np
from cython cimport view
from libcpp.string cimport string

cdef extern from "pysdmm.h" namespace "sopt::pySDMM":
    void c_sdmm_solver[T](T* input, T* result, T* ln_data, T* target_data, 
                          int N, int NPROX) except+;


class solver:
    def __init__(self, itermax = None, gamma = None, proximal = None, 
                 Ln = None, targets = None, cg_tolerance = 1e-12):
        self.config = {}
        self.paramlist = ['itermax', 'gamma', 'proximal', 'Ln', 'cg_tolerance','targets']
        self.config['itermax'] = itermax
        self.config['gamma'] = gamma
        self.config['cg_tolerance'] = cg_tolerance
        self.config['proximal'] = proximal
        self.config['Ln'] = Ln
        self.config['targets'] = targets
    
    def __setitem__(self, key, item):
        if key not in self.config:
            raise NameError(key, "is not a parameter of the SDMM solver")
        else:
            self.config[key] = item
       
    def print_config(self):
        print self.config



    def solve(self, input):
        N = input.size # size need to be controled here
        NPROX = len(self.config['Ln'])
        
        self.config['Ln'] = np.array(self.config['Ln'])
        Ln = self.config['Ln'].reshape(self.config['Ln'].size)
        
        self.config['targets'] = np.array(self.config['targets'])
        targets = self.config['targets'].reshape(self.config['targets'].size)
        
        result = np.zeros(N, dtype=input.dtype)
        cdef:
            long input_data = input.ctypes.data
            long result_data = result.ctypes.data
            long ln_data = Ln.ctypes.data
            long target_data = Ln.ctypes.data

        c_sdmm_solver[double](<double*>input_data, <double *>result_data,<double*>ln_data,
                              <double*>target_data, <int>N, <int>NPROX)


#        elif input.dtype == 'complex128':
#        c_sdmm_solver[complex](<double complex*>input_data, <double complex *>result_data, N)

        print 'ok'
        return result
