#ifndef BICO_TRAITS_H
#define BICO_TRAITS_H

#include <Eigen/Core>
#include <complex>

namespace sopt {

  //! Root of the type hierarchy for signed integers
  typedef int t_int;
  //! Root of the type hierarchy for unsigned integers
  typedef size_t t_uint;
  //! Root of the type hierarchy for real numbers
  typedef double t_real;
  //! Root of the type hierarchy for (real) complex numbers
  typedef std::complex<t_real> t_complex;


  //! Real vectors
  typedef Eigen::Array<t_real, Eigen::Dynamic, 1> t_rVector;
  //! Complex vectors
  typedef Eigen::Array<t_complex, Eigen::Dynamic, 1> t_cVector;
  //! Real matrices
  typedef Eigen::Array<t_real, Eigen::Dynamic, Eigen::Dynamic> t_rMatrix;
  //! Complex matrices
  typedef Eigen::Array<t_complex, Eigen::Dynamic, Eigen::Dynamic> t_cMatrix;
}
#endif

