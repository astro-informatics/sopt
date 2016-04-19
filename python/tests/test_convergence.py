from pytest import fixture, mark


@fixture
def default():
    from sopt.convergence import ConvergenceFunction
    return ConvergenceFunction()

def any_larger_than_one(input):
    from numpy import any, abs
    return any(abs(input) > 1e0)

@fixture
def larger_than_one():
    from sopt.convergence import ConvergenceFunction
    return ConvergenceFunction(any_larger_than_one)


@mark.parametrize('input', (
    [1, 2, 3],
    [1j, 2j, 3j],
))
def test_default(default, input):
    assert default(input) == False
    assert default(input, True) == False


@mark.parametrize('input', (
    [0.9, 0, 0.5],
    [0.9j, 0j, 0.5j],
    [1.9, 0, 0.5],
    [1.9j, 0j, 0.5j],
))
def test_real_convergence_callback(larger_than_one, input):
    assert larger_than_one(input) == any_larger_than_one(input)
    assert larger_than_one(input, gothroughC=True) == any_larger_than_one(input)
