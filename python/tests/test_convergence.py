from pytest import fixture


@fixture
def real_convfunc():
    from sopt.convergence import ConvergenceFunction
    return ConvergenceFunction(real=True)


@fixture
def complex_convfunc():
    from sopt.convergence import ConvergenceFunction
    return ConvergenceFunction(real=False)


def test_default_real(real_convfunc):
    from numpy import array
    a = array([1, 2, 4])
    assert not real_convfunc(a)
    assert not real_convfunc._call_real(a)


def test_default_complex(complex_convfunc):
    from numpy import array
    a = array([1, 2, 4])
    assert not complex_convfunc(a)
    assert not complex_convfunc._call_complex(a)


def any_larger_than_one(input):
    from numpy import any, abs
    return any(abs(input) > 1e0)


def test_real_convergence_callback():
    from sopt.convergence import ConvergenceFunction
    convfunc = ConvergenceFunction(real=True, function=any_larger_than_one)
    assert convfunc([1, 0, 0.1]) == False
    assert convfunc._call_real([1, 0, 0.1]) == False
    assert convfunc([1, 0, 1.1]) == True
    assert convfunc._call_real([1, 0, 1.1]) == True


def test_complex_convergence_callback():
    from sopt.convergence import ConvergenceFunction
    convfunc = ConvergenceFunction(real=False, function=any_larger_than_one)
    assert convfunc([1, 0, 0.1]) == False
    assert convfunc._call_complex([1, 0, 0.1]) == False
    assert convfunc([1, 0, 1.1]) == True
    assert convfunc._call_complex([1, 0, 1.1]) == True
    assert convfunc([1j, 0, 0.1]) == False
    assert convfunc._call_complex([1j, 0, 0.1]) == False
    assert convfunc([1j, 0, 1.1]) == True
    assert convfunc._call_complex([1j, 0, 1.1]) == True
