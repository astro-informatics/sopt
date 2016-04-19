cimport sopt.function
cimport numpy

cdef void double_opfunc_to_python(object func, Vector[double] &input, Vector[double] &output):
    """ Makes a call to a python function from C++

        Maps Vector[double] to numpy array
    """
    from numpy import frombuffer
    cdef:
        int Nin = input.size()
        int Nout = output.size()
        double[::1] pyinput = <double[:Nin:1]> input.data()
        double[::1] pyoutput = <double[:Nout:1]> output.data()

    func(frombuffer(pyinput, dtype="double"), frombuffer(pyoutput, dtype="double"))
