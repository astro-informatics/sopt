from sopt.function cimport OperatorFunction, Vector, wrap_operator_function_double, \
        double_opfunc_to_python

cdef void call_operator_function(OperatorFunction[Vector[double]]& op, double[::1] input,
                                 double [::1] output) except *:
    """ Calls an OperatorFunction from python

        This should almost never be necessary. So only setup in test.
    """
    cdef:
        Vector[double] cinput
        Vector[double] coutput

    cinput.resize(len(input))
    coutput.resize(len(output))
    for i in range(len(input)):
        cinput[i] = input[i]

    op(coutput, cinput)

    for i in range(len(output)):
        output[i] = coutput[i]

def python_callback(input, callback):
    from numpy import zeros
    cdef:
        OperatorFunction[Vector[double]] coperator \
                = wrap_operator_function_double(double_opfunc_to_python, callback)

    output = zeros(input.shape, dtype='float64')
    call_operator_function(coperator, input, output)
    return output
