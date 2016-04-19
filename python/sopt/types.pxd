from libcpp.complex cimport complex as ccomplex

ctypedef size_t t_uint
ctypedef int t_int
ctypedef double t_real
ctypedef ccomplex[double] t_complex

cdef extern from "sopt/types.h" namespace "sopt":

    cdef cppclass Vector[T]:
        Vector()
        Vector(int)
        T* data()
        int size()
        void resize(int)
        T& operator[](int)

    cdef cppclass OperatorFunction[T]:
        OperatorFunction()
        void operator()(T &, T &)
