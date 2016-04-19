cimport sopt.function
cimport numpy

cdef api void sopt_operator_function_callback(
    object func, Vector[double] &input, Vector[double] &output):
    """ Makes a call to a python function """
    from numpy import asarray
    cdef:
        int Nin = input.size()
        int Nout = output.size()
        double[::1] pyinput = <double[:Nin:1]> input.data()
        double[::1] pyoutput = <double[:Nout:1]> output.data()

    func(asarray(pyinput), asarray(pyoutput))

cdef void call_operator_function(OperatorFunction[Vector[double]]& op, double[::1] input,
                                 double [::1] output) except *:
    cdef:
        Vector[double] cinput
        Vector[double] coutput

    print(len(input), len(output))
    cinput.resize(len(input))
    coutput.resize(len(output))
    for i in range(len(input)):
        cinput[i] = input[i]

    op(coutput, cinput)

    for i in range(len(output)):
        output[i] = coutput[i]
