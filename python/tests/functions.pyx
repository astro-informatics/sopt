from sopt.function cimport OperatorFunction, call_operator_function,\
     Vector, wrap_operator_function, call_operator_function

def python_callback(input, callback):
    from numpy import zeros
    cdef:
        OperatorFunction[Vector[double]] coperator \
                = wrap_operator_function[double](callback)

    output = zeros(input.shape, dtype='float64')
    call_operator_function(coperator, input, output)
    return output
