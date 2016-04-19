from pytest import fixture


@fixture
def sdmm():
    """ An empty sdmm object """
    from sopt.sdmm import SDMM
    return SDMM()


def test_itermax_property(sdmm):
    assert sdmm.itermax == 2**64 - 1
    sdmm.itermax = 10
    assert sdmm.itermax == 10


def test_gamma_property(sdmm):
    from numpy import allclose
    assert allclose(sdmm.gamma, 1e-8, 1e-16)
    sdmm.gamma = 1e-4
    assert allclose(sdmm.gamma, 1e-4, 1e-16)


def test_convergence_property(sdmm):
    assert sdmm.convergence([1]) == False
    sdmm.convergence = lambda x: True
    assert sdmm.convergence([1]) == True
