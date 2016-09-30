#ifndef SOPT_FORWARD_BACKWARD_H
#define SOPT_FORWARD_BACKWARD_H

#include "sopt/config.h"
#include <functional>
#include <limits>
#include "sopt/exception.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/types.h"

namespace sopt {
namespace algorithm {

//! \brief Forward-Backward algorithm: solves \f$\min_{x}f(x) + g(x)\f$
//! \details The algorithm requires the proximal of f and the gradient g.
template <class SCALAR> class ForwardBackward {
public:
  //! Scalar type
  typedef SCALAR value_type;
  //! Scalar type
  typedef value_type Scalar;
  //! Real type
  typedef typename real_type<Scalar>::type Real;
  //! Type of then underlying vectors
  typedef Vector<Scalar> t_Vector;
  //! Type of the convergence function
  typedef ConvergenceFunction<Scalar> t_IsConverged;
  //! Type of the proximal function
  typedef ProximalFunction<Scalar> t_Proximal;
  //! Type of the gradient of a multivalued function
  typedef OperatorFunction<Vector<Scalar>> t_Gradient;

  //! Values indicating how the algorithm ran
  struct Diagnostic {
    //! Number of iterations
    t_uint niters;
    //! Wether convergence was achieved
    bool good;
  };
  //! Holds result vector as well
  struct DiagnosticAndResult : public Diagnostic {
    //! Output x
    t_Vector x;
  };

  //! Setups ForwardBackward
  //! \param[in] f_proximal: proximal operator of the \f$f\f$ function.
  //! \param[in] g_gradient: gradient operator of the \f$g\f$ function
  ForwardBackward(t_Proximal const &f_proximal, t_Gradient const &g_gradient)
      : itermax_(std::numeric_limits<t_uint>::max()), gamma_(1e-8), f_proximal_(f_proximal),
        g_gradient_(g_gradient) {}
  //! Convenience constructor for different parameters order
  ForwardBackward(t_Gradient const &g_gradient, t_Proximal const &f_proximal)
      : ForwardBackward(f_proximal, g_gradient) {}
  virtual ~ForwardBackward() {}

// Macro helps define properties that can be initialized as in
// auto fb  = ForwardBackward<float>().prop0(value).prop1(value);
#define SOPT_MACRO(NAME, TYPE)                                                                     \
  TYPE const &NAME() const { return NAME##_; }                                                     \
  ForwardBackward<SCALAR> &NAME(TYPE const &NAME) {                                                \
    NAME##_ = NAME;                                                                                \
    return *this;                                                                                  \
  }                                                                                                \
                                                                                                   \
protected:                                                                                         \
  TYPE NAME##_;                                                                                    \
                                                                                                   \
public:

  //! Maximum number of iterations
  SOPT_MACRO(itermax, t_uint);
  //! γ parameter
  SOPT_MACRO(gamma, Real);
  //! A function verifying convergence
  SOPT_MACRO(is_converged, t_IsConverged);
  //! Proximal of f
  SOPT_MACRO(f_proximal, t_Proximal);
  //! Gradient of g
  SOPT_MACRO(g_gradient, t_Gradient);
#undef SOPT_MACRO
  //! \brief Simplifies calling the proximal of f
  void f_proximal(t_Vector &out, Real gamma, t_Vector const &x) const {
    f_proximal()(out, gamma, x);
  }
  //! \brief Simplifies calling the gradient of g
  void g_gradient(t_Vector &out, t_Vector const &x) const { g_gradient()(out, x); }

  //! Facilitates call to user-provided convergence function
  bool is_converged(t_Vector const &x) const {
    return static_cast<bool>(is_converged()) and is_converged()(x);
  }

  //! \brief Calls Forward-Backward algorithm
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  Diagnostic operator()(t_Vector &out, t_Vector const &guess) const {
    out = guess;
    return operator()(out);
  }

  //! \brief Calls Forward-Backward algorithm
  //! \param[inout] out: initial guess and output vector
  Diagnostic operator()(t_Vector &out) const;

  //! Calls Forward-Backward algorithm
  DiagnosticAndResult operator()(t_Vector const &initial_guess) const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.x, initial_guess);
    return result;
  }
  //! \brief Calls Forward-Backward algorithm
  //! \param[in] N: Size of the input and output vectors
  DiagnosticAndResult operator()(t_uint N) const { return operator()(t_Vector::Random(N)); }
};

template <class SCALAR>
typename ForwardBackward<SCALAR>::Diagnostic ForwardBackward<SCALAR>::
operator()(t_Vector &out) const {

  SOPT_HIGH_LOG("Performing Forward-Backward");
  t_Vector grad = t_Vector::Zero(out.size());

  for(t_uint niters(0); niters < itermax(); ++niters) {
    SOPT_LOW_LOG("    - Iteration {}/{}", niters, itermax());
    g_gradient(grad, out);
    f_proximal(out, gamma(), out - gamma() * grad);

    if(is_converged(out)) {
      SOPT_MEDIUM_LOG("    - converged in {} of {} iterations", niters, itermax());
      return {niters, true};
    }
  }

  // check function exists, otherwise, don't know if convergence is meaningful
  if(static_cast<bool>(is_converged()))
    SOPT_ERROR("    - did not converge within {} iterations", itermax());
  return {itermax(), false};
}
}
} /* sopt::algorithm */
#endif
