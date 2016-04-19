from sopt.tests import functions
def double_input(input, output):
    output[:] = 2 * input

def test_python_callback():
    from numpy.random import random
    from numpy import allclose
    input = random(10).astype('float64')
    output = functions.python_callback(input, double_input)
    assert allclose(2 * input, output)
