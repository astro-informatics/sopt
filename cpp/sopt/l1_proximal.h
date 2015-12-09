#ifndef SOPT_L1_PROXIMAL_H
#define SOPT_L1_PROXIMAL_H

#include <iostream>
#include <type_traits>
#include <Eigen/Core>

#include "sopt/utility.h"
#include "sopt/proximal_expression.h"
#include "sopt/linear_transform.h"

namespace sopt { namespace proximal {

//! \brief L1 proximal, including linear transform
//! \details This function computes the prox operator of the l1
//!  norm for the input vector \f$x\f$. It solves the problem:
//!  \f[ min_{z} 0.5||x - z||_2^2 + γ ||Ψ^† z||_w1 \f]
//!  where \f$Ψ \in C^{N_x \times N_r} \f$ is the sparsifying operator, and \f[|| ||_w1\f] is the
//!  weighted L1 norm.
template<class SCALAR> class L1TightFrame
{
  public:
    //! Underlying scalar type
    typedef SCALAR Scalar;
    //! Underlying real scalar type
    typedef typename real_type<Scalar>::type Real;

    L1TightFrame() : Psi_(linear_transform_identity<Scalar>()), nu_(1e0), weights_(1) {
      weights_(0) = 1;
    }

#   define SOPT_MACRO(NAME, TYPE)                                                           \
        TYPE const& NAME() const { return NAME ## _; }                                      \
        L1TightFrame<Scalar> & NAME(TYPE const &NAME) { NAME ## _ = NAME; return *this; }   \
      protected:                                                                            \
        TYPE NAME ## _;                                                                     \
      public:
    //! Linear transform applied to input prior to L1 norm
    SOPT_MACRO(Psi, LinearTransform< Vector<Scalar> >);
    //! Bound on the squared norm of the operator Psi
    SOPT_MACRO(nu, Real);
#   undef SOPT_MACRO
    //! Weights of the l1 norm
    Vector<Real> const & weights() const { return weights_; }
    //! Weights of the l1 norm
    template<class T> L1TightFrame<Scalar>& weights(Eigen::MatrixBase<T> const &w)  {
      if((w.array() < 0e0).any())
        SOPT_THROW("Weights cannot be negative");
      if(w.stableNorm() < 1e-12)
        SOPT_THROW("Weights cannot be null");
      weights_ = w;
      return *this;
    }

    //! Set weights to a single value
    L1TightFrame<Scalar> & weights(Real const &value) {
      if(value <= 0e0)
        SOPT_THROW("Weight cannot be negative or null");
      weights_ = Vector<Real>::Ones(1) * value;
      return *this;
    }

    //! Set Psi and Psi^† using a matrix
    template<class T>
      L1TightFrame& Psi(Eigen::MatrixBase<T> const &psi) {
        return Psi(linear_transform(psi));
      }

    //! Computes proximal for given γ
    template<class T0, class T1>
    typename std::enable_if<
      is_complex<Scalar>::value == is_complex<typename T0::Scalar>::value
      and is_complex<Scalar>::value == is_complex<typename T1::Scalar>::value
    >::type operator()(
        Eigen::MatrixBase<T0> &out, Real gamma, Eigen::MatrixBase<T1> const &x) const;

    //! Lazy version
    template<class T0>
      ProximalExpression<L1TightFrame<Scalar> const&, T0>
      operator()(Real const &gamma, Eigen::MatrixBase<T0> const &x) const {
        return {*this, gamma, x};
      }

    //! \f[ 0.5||x - z||_2^2 + γ||Ψ^† z||_w1 \f]
    template<class T0, class T1>
    typename std::enable_if<
      is_complex<Scalar>::value == is_complex<typename T0::Scalar>::value
      and is_complex<Scalar>::value == is_complex<typename T1::Scalar>::value,
      Real
    > :: type objective(
        Eigen::MatrixBase<T0> const &x, Eigen::MatrixBase<T1> const &z, Real const &gamma) const;

  protected:
    //! Weights associated with the l1-norm
    Vector<Real> weights_;

};

template<class SCALAR> template<class T0, class T1>
typename std::enable_if<
  is_complex<SCALAR>::value == is_complex<typename T0::Scalar>::value
  and is_complex<SCALAR>::value == is_complex<typename T1::Scalar>::value
>::type L1TightFrame<SCALAR>::operator()(
    Eigen::MatrixBase<T0> &out, Real gamma, Eigen::MatrixBase<T1> const &x) const {

  Vector<Scalar> const psit_x = Psi().adjoint() * x;
  if(weights().size() == 1)
    out = Psi() * (soft_threshhold(psit_x, nu() * gamma * weights()(0)) - psit_x) / nu() + x;
  else
    out = Psi() * (soft_threshhold(psit_x, nu() * gamma * weights()) - psit_x) / nu() + x;
  SOPT_INFO("Prox L1: objective = {}", objective(x, out, gamma));
}

template<class SCALAR> template<class T0, class T1>
typename std::enable_if<
  is_complex<SCALAR>::value == is_complex<typename T0::Scalar>::value
  and is_complex<SCALAR>::value == is_complex<typename T1::Scalar>::value,
  typename real_type<SCALAR>::type
> :: type L1TightFrame<SCALAR>::objective(
    Eigen::MatrixBase<T0> const &x, Eigen::MatrixBase<T1> const &z, Real const &gamma) const {
  if(weights().size() == 1)
    return 0.5 * (x - z).squaredNorm() + gamma * sopt::l1_norm(Psi().adjoint() * z) * weights()(0);
  else {
    return 0.5 * (x - z).squaredNorm()
      + gamma * sopt::l1_norm(Psi().adjoint() * z, weights());
  }
}

//! \brief L1 proximal, including linear transform
//! \details This function computes the prox operator of the l1
//!  norm for the input vector \f$x\f$. It solves the problem:
//!  \f[ min_{z} 0.5||x - z||_2^2 + γ ||Ψ^† z||_w1 \f]
//!  where \f$Ψ \in C^{N_x \times N_r} \f$ is the sparsifying operator, and \f[|| ||_w1\f] is the
//!  weighted L1 norm.
template<class SCALAR> class L1 : protected L1TightFrame<SCALAR> {
    //! Functor to do fista mixing
    struct FistaMixing;
    //! Functor to do no mixing
    struct NoMixing;
  public:
    //! Underlying scalar type
    typedef typename L1TightFrame<SCALAR>::Scalar Scalar;
    //! Underlying real scalar type
    typedef typename L1TightFrame<SCALAR>::Real Real;

    enum class Error : t_uint {
      NONE = 0,
      OTHER = 1,
      CYCLE = 2,
      ITERATIONS = 3,
    };
    //! How did calling L1 go?
    struct Diagnostic {
      //! Number of iterations
      t_uint niters;
      //! Relative variation of the objective function
      Real relative_variation;
      //! Value of the objective function
      Real objective;
      //! Wether convergence was achieved
      bool good;
      //! Kind of error
      Error error;
    };

    //! Result from calling L1
    struct DiagnosticAndResult : public Diagnostic {
      //! The proximal value
      Vector<SCALAR> proximal;
    };

    //! Computes proximal for given γ
    template<class T0, class T1>
    Diagnostic operator()(
        Eigen::MatrixBase<T0> &out, Real gamma, Eigen::MatrixBase<T1> const &x) const {
      if(fista_mixing())
        return operator()(out, gamma, x, FistaMixing());
      else
        return operator()(out, gamma, x, NoMixing());
    }

    //! Lazy version
    template<class T0>
    DiagnosticAndResult operator()(Real const &gamma, Eigen::MatrixBase<T0> const &x) const {
      DiagnosticAndResult result;
      static_cast<Diagnostic&>(result) = operator()(result.proximal, gamma, x);
      return result;
    }

    L1() : L1TightFrame<SCALAR>(), itermax_(0), tolerance_(1e-8), positivity_constraint_(false),
      real_constraint_(false), fista_mixing_(true) {}

#   define SOPT_MACRO(NAME, TYPE)                                                           \
        TYPE const& NAME() const { return NAME ## _; }                                      \
        L1<Scalar> & NAME(TYPE const &NAME) { NAME ## _ = NAME; return *this; }             \
      protected:                                                                            \
        TYPE NAME ## _;                                                                     \
      public:
    //! \brief Maximum number of iterations before bailing out
    //! \details 0 means algorithm breaks only if convergence is reached.
    SOPT_MACRO(itermax, t_uint);
    //! Tolerance criteria
    SOPT_MACRO(tolerance, Real);
    //! Whether to apply positivity constraints
    SOPT_MACRO(positivity_constraint, bool);
    //! Whether the output should be constrained to be real
    SOPT_MACRO(real_constraint, bool);
    //! Whether to do fista mixing or not
    SOPT_MACRO(fista_mixing, bool);
#   undef SOPT_MACRO

#   define SOPT_MACRO(NAME, TYPE)   \
        TYPE const & NAME() const { return L1TightFrame<SCALAR>::NAME(); }                      \
        L1<Scalar> & NAME(TYPE const &NAME) { L1TightFrame<SCALAR>::NAME(NAME); return *this; } \
    //! Linear transform applied to input prior to L1 norm
    SOPT_MACRO(Psi, LinearTransform< Vector<Scalar> >);
    //! Bound on the squared norm of the operator Psi
    SOPT_MACRO(nu, Real);
    //! Conjugate gradient
    SOPT_MACRO(weights, Vector<Real>);
#   undef SOPT_MACRO

#   define SOPT_MACRO(NAME, TYPE)   \
        L1<Scalar> & NAME(TYPE const &NAME) { L1TightFrame<SCALAR>::NAME(NAME); return *this; }
    //! Set weights to a single value
    SOPT_MACRO(weights, Real);
    //! Set Psi and Psi^† using a matrix
    template<class T> SOPT_MACRO(Psi, Eigen::MatrixBase<T>);
#   undef SOPT_MACRO

    //! \f[ 0.5||x - z||_2^2 + γ||Ψ^† z||_w1 \f]
    template<class T0, class T1>
    Real objective(
        Eigen::MatrixBase<T0> const &x, Eigen::MatrixBase<T1> const &z, Real const &gamma) const {
      return L1TightFrame<SCALAR>::objective(x, z, gamma);
    }

    //! \brief Special case if Psi ia a tight frame.
    //! \see L1TightFrame
    template<class ... T>
    auto tight_frame(T &&... args) const
    -> decltype(L1TightFrame<Scalar>::operator()(std::forward<T>(args)...)) {
      return L1TightFrame<Scalar>::operator()(std::forward<T>(args)...);
    }

  protected:
    //! Applies one or another soft-threshhold, depending on weight
    template<class T0, class T1>
    void apply_soft_threshhold(
        Eigen::MatrixBase<T0> &out, Real gamma, Eigen::MatrixBase<T1> const &x) const;
    //! Applies constraints to input expression
    template<class T0, class T1>
    void apply_constraints(Eigen::MatrixBase<T0> &out, Eigen::MatrixBase<T1> const &x) const;

    //! Operation with explicit mixing step
    template<class T0, class T1, class MIXING>
    Diagnostic operator()(
      Eigen::MatrixBase<T0> &out, Real gamma, Eigen::MatrixBase<T1> const &x, MIXING mixing) const;
};

//! Computes proximal for given γ
template<class SCALAR> template<class T0, class T1, class MIXING>
typename L1<SCALAR>::Diagnostic L1<SCALAR>::operator()(
    Eigen::MatrixBase<T0> &out, Real gamma, Eigen::MatrixBase<T1> const &x, MIXING mixing) const {

  Real previous_objective(0);
  Real rel_obj(0);

  SOPT_INFO("  Proximal L1 operator:");
  t_uint niters = 0;
  bool good = false;

  // first iteration sets things up
  t_uint const CURRENT = 0, PREVIOUS = 1, FAR = 2, FARTHER = 3;
  // Storing more objectives to detect cycles of 2
  out = x;
  Real objectives[4] = {objective(x, out, gamma), 0, 0, 0};
  SOPT_NOTICE("    - iter {}, prox_fval = {}", niters, objectives[CURRENT]);
  Vector<Scalar> const res = Psi().adjoint() * out;
  Vector<Scalar> threshholded;
  apply_soft_threshhold(threshholded, gamma, res);
  Vector<Scalar> u_l1 = 1e0 / nu() * (res - threshholded);
  apply_constraints(out, x - Psi() * u_l1);
  objectives[PREVIOUS] = objectives[CURRENT];

  Error error = Error::ITERATIONS;
  // Move on to other iterations
  for(++niters; niters < itermax() or itermax() == 0; ++niters) {

    objectives[CURRENT] = objective(x, out, gamma);
    rel_obj = std::abs(objectives[CURRENT] - objectives[PREVIOUS]) / objectives[CURRENT];

    SOPT_NOTICE(
        "    - iter {}, prox_fval = {}, rel_fval = {}", niters, objectives[CURRENT], rel_obj);
    if(rel_obj < tolerance()) {
      good = true;
      error = Error::NONE;
      break;
    } else if( std::abs(objectives[CURRENT] - objectives[FAR]) < tolerance()
        and std::abs(objectives[PREVIOUS] - objectives[FARTHER]) < tolerance() ) {
      good = false;
      error = Error::CYCLE;
      break;
    }

    Vector<Scalar> const res = u_l1 * nu() + Psi().adjoint() * out;
    apply_soft_threshhold(threshholded, gamma, res);
    mixing(u_l1, 1e0 / nu() * (res - threshholded), niters);

    apply_constraints(out, x - Psi() * u_l1);
    objectives[FARTHER] = objectives[FAR];
    objectives[FAR] = objectives[PREVIOUS];
    objectives[PREVIOUS] = objectives[CURRENT];
  }

  return {niters, rel_obj, objectives[CURRENT], good, error};
}

template<class SCALAR> template<class T0, class T1>
void L1<SCALAR>::apply_soft_threshhold(
    Eigen::MatrixBase<T0> &out, Real gamma, Eigen::MatrixBase<T1> const &x) const {
  if(weights().size() == 1)
    out = soft_threshhold(x, gamma * weights()(0));
  else
    out = soft_threshhold(x, gamma * weights());
}

template<class SCALAR> template<class T0, class T1>
void L1<SCALAR>::apply_constraints(
    Eigen::MatrixBase<T0> &out, Eigen::MatrixBase<T1> const &x) const {
  if(positivity_constraint())
    out = sopt::positive_quadrant(x);
  else if(real_constraint())
    out = x.real().template cast<SCALAR>();
  else
    out = x;
}

template<class SCALAR> struct L1<SCALAR>::FistaMixing {
  typedef typename real_type<SCALAR>::type Real;
  FistaMixing() : t(1) {};
  template<class T1>
    void operator()(Vector<SCALAR> &previous, Eigen::MatrixBase<T1> const &unmixed, t_uint iter) {
      // reset
      if(iter == 0) {
        previous = unmixed;
        return;
      }
      if(iter <= 1) t = next(1);
      auto const next_t = next(t);
      auto const alpha = (t - 1) / next_t;
      t = next_t;
      previous = (1e0 + alpha) * unmixed.derived() - alpha * previous;
    }
  static Real next(Real t) { return 0.5 + 0.5 * std::sqrt(1e0 + 4e0 * t * t); }
  Real t;
};

template<class SCALAR> struct L1<SCALAR>::NoMixing {
  template<class T1>
    void operator()(Vector<SCALAR> &previous, Eigen::MatrixBase<T1> const &unmixed, t_uint) {
      previous = unmixed;
    }
};

}} /* sopt::proximal */

#endif