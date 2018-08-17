#ifndef SOPT_L1_FORWARD_BACKWARD_H
#define SOPT_L1_FORWARD_BACKWARD_H

#include "sopt/config.h"
#include <numeric>
#include <tuple>
#include <utility>
#include "sopt/exception.h"
#include "sopt/forward_backward.h"
#include "sopt/l1_proximal.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/objective_functions.h"
#include "sopt/proximal.h"
#include "sopt/relative_variation.h"
#include "sopt/types.h"

namespace sopt {
namespace algorithm {
template <class SCALAR>
class ImagingForwardBackward {
  //! Underlying algorithm
  typedef ForwardBackward<SCALAR> FB;

 public:
  typedef typename FB::value_type value_type;
  typedef typename FB::Scalar Scalar;
  typedef typename FB::Real Real;
  typedef typename FB::t_Vector t_Vector;
  typedef typename FB::t_OperatorFunction t_OperatorFunction;
  typedef typename FB::t_LinearTransform t_LinearTransform;
  typedef typename FB::t_Proximal t_Proximal;
  typedef typename FB::t_IsConverged t_IsConverged;

  //! Values indicating how the algorithm ran
  struct Diagnostic : public FB::Diagnostic {
    //! Diagnostic from calling L1 proximal
    typename proximal::L1<Scalar>::Diagnostic l1_diagnostic;
    Diagnostic(t_uint niters = 0u, bool good = false,
               typename proximal::L1<Scalar>::Diagnostic const &l1diag =
                   typename proximal::L1<Scalar>::Diagnostic())
        : FB::Diagnostic(niters, good), l1_diagnostic(l1diag) {}
    Diagnostic(t_uint niters, bool good, typename proximal::L1<Scalar>::Diagnostic const &l1diag,
               t_Vector &&residual)
        : FB::Diagnostic(niters, good, std::move(residual)), l1_diagnostic(l1diag) {}
  };
  //! Holds result vector as well
  struct DiagnosticAndResult : public Diagnostic {
    //! Output x
    t_Vector x;
  };

  //! Setups imaging wrapper for Forward Backward
  //! \param[in] f_proximal: proximal operator of the \f$f\f$ function.
  //! \param[in] g_proximal: proximal operator of the \f$g\f$ function
  template <class DERIVED>
  ImagingForwardBackward(Eigen::MatrixBase<DERIVED> const &target)
      : l1_proximal_(),
        tight_frame_(false),
        residual_tolerance_(1e-4),
        relative_variation_(1e-4),
        residual_convergence_(nullptr),
        objective_convergence_(nullptr),
        itermax_(std::numeric_limits<t_uint>::max()),
        beta_(1e-8),
        mu_(1),
        sigma_(1),
        is_converged_(),
        PhiTPhi_([](t_Vector &out, const t_Vector &in) { out = in; }),
        target_(target) {}
  virtual ~ImagingForwardBackward() {}

// Macro helps define properties that can be initialized as in
// auto padmm = ImagingForwardBackward<float>().prop0(value).prop1(value);
#define SOPT_MACRO(NAME, TYPE)                             \
  TYPE const &NAME() const { return NAME##_; }             \
  ImagingForwardBackward<SCALAR> &NAME(TYPE const &NAME) { \
    NAME##_ = NAME;                                        \
    return *this;                                          \
  }                                                        \
                                                           \
 protected:                                                \
  TYPE NAME##_;                                            \
                                                           \
 public:

  //! Maximum number of iterations
  SOPT_MACRO(l1_proximal, proximal::L1<Scalar>);
  //! Whether Ψ is a tight-frame or not
  SOPT_MACRO(tight_frame, bool);
  //! \brief Convergence of the relative variation of the objective functions
  //! \details If negative, this convergence criteria is disabled.
  SOPT_MACRO(residual_tolerance, Real);
  //! \brief Convergence of the relative variation of the objective functions
  //! \details If negative, this convergence criteria is disabled.
  SOPT_MACRO(relative_variation, Real);
  //! \brief Convergence of the residuals
  //! \details If negative, this convergence criteria is disabled.
  SOPT_MACRO(residual_convergence, t_IsConverged);
  //! \brief Convergence of the residuals
  //! \details If negative, this convergence criteria is disabled.
  SOPT_MACRO(objective_convergence, t_IsConverged);
  //! Maximum number of iterations
  SOPT_MACRO(itermax, t_uint);
  //! σ parameter
  SOPT_MACRO(sigma, Real);
  //! μ parameter
  SOPT_MACRO(mu, Real);
  //! Gradient step size β
  SOPT_MACRO(beta, Real);
  //! A function verifying convergence
  SOPT_MACRO(is_converged, t_IsConverged);
  //! Compact Measurement operator
  SOPT_MACRO(PhiTPhi, t_OperatorFunction);

#undef SOPT_MACRO
  //! Vector of target measurements
  t_Vector const &target() const { return target_; }
  //! Sets the vector of target measurements
  template <class DERIVED>
  ImagingForwardBackward &target(Eigen::MatrixBase<DERIVED> const &target) {
    target_ = target;
    return *this;
  }

  //! \brief Calls FB
  //! \param[out] out: Output vector x
  Diagnostic operator()(t_Vector &out) const {
    return operator()(out, FB::initial_guess(target()));
  }
  //! \brief Calls FB
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  Diagnostic operator()(t_Vector &out, std::tuple<t_Vector, t_Vector> const &guess) const {
    return operator()(out, std::get<0>(guess), std::get<1>(guess));
  }
  //! \brief Calls FB
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  Diagnostic operator()(t_Vector &out,
                        std::tuple<t_Vector const &, t_Vector const &> const &guess) const {
    return operator()(out, std::get<0>(guess), std::get<1>(guess));
  }
  //! \brief Calls FB
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()(std::tuple<t_Vector, t_Vector> const &guess) const {
    return operator()(std::tie(std::get<0>(guess), std::get<1>(guess)));
  }
  //! \brief Calls FB
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()(
      std::tuple<t_Vector const &, t_Vector const &> const &guess) const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.x, guess);
    return result;
  }
  //! \brief Calls FB
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()() const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.x, FB::initial_guess(target()));
    return result;
  }
  //! Makes it simple to chain different calls to FB
  DiagnosticAndResult operator()(DiagnosticAndResult const &warmstart) const {
    DiagnosticAndResult result = warmstart;
    static_cast<Diagnostic &>(result) = operator()(result.x, warmstart.x, warmstart.residual);
    return result;
  }

  //! \brief L1 proximal used during calculation
  //! \details Non-const version to setup the object.
  proximal::L1<Scalar> &l1_proximal() { return l1_proximal_; }

  //! \brief Analysis operator Ψ
  //! \details Under-the-hood, the object is actually owned by the L1 proximal.
  t_LinearTransform const &Psi() const { return l1_proximal().Psi(); }
  //! Analysis operator Ψ
  template <class... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, ImagingForwardBackward<Scalar> &>::type Psi(
      ARGS &&... args) {
    l1_proximal().Psi(std::forward<ARGS>(args)...);
    return *this;
  }

// Forwards get/setters to L1 proximal
// In practice, we end up with a bunch of functions that make it simpler to set or get values
// associated with the two proximal operators.
// E.g.: `paddm.l1_proximal_itermax(100).l1_proximal_tolerance(1e-4)`.
// ~~~
#define SOPT_MACRO(VAR, NAME, PROXIMAL)                                                            \
  /** \brief Forwards to l1_proximal **/                                                           \
  decltype(std::declval<proximal::PROXIMAL<Scalar> const>().VAR()) NAME##_proximal_##VAR() const { \
    return NAME##_proximal().VAR();                                                                \
  }                                                                                                \
  /** \brief Forwards to l1_proximal **/                                                           \
  ImagingForwardBackward<Scalar> &NAME##_proximal_##VAR(                                           \
      decltype(std::declval<proximal::PROXIMAL<Scalar> const>().VAR()) VAR) {                      \
    NAME##_proximal().VAR(VAR);                                                                    \
    return *this;                                                                                  \
  }
  SOPT_MACRO(itermax, l1, L1);
  SOPT_MACRO(tolerance, l1, L1);
  SOPT_MACRO(positivity_constraint, l1, L1);
  SOPT_MACRO(real_constraint, l1, L1);
  SOPT_MACRO(fista_mixing, l1, L1);
  SOPT_MACRO(nu, l1, L1);
  SOPT_MACRO(weights, l1, L1);
#ifdef SOPT_MPI
  SOPT_MACRO(direct_space_comm, l1, L1);
  SOPT_MACRO(adjoint_space_comm, l1, L1);
#endif
#undef SOPT_MACRO

  //! Helper function to set-up default residual convergence function
  ImagingForwardBackward<Scalar> &residual_convergence(Real const &tolerance) {
    return residual_convergence(nullptr).residual_tolerance(tolerance);
  }
  //! Helper function to set-up default residual convergence function
  ImagingForwardBackward<Scalar> &objective_convergence(Real const &tolerance) {
    return objective_convergence(nullptr).relative_variation(tolerance);
  }
  //! Convergence function that takes only the output as argument
  ImagingForwardBackward<Scalar> &is_converged(std::function<bool(t_Vector const &x)> const &func) {
    return is_converged([func](t_Vector const &x, t_Vector const &) { return func(x); });
  }
  //! Return objective function that is being minimized
  std::function<t_real(t_Vector)> const objective_function() const {
    return objective_functions::unconstrained_l1_regularisation<t_Vector>(mu(), sigma(), target(),
                                                                          PhiTPhi(), Psi());
  }

 protected:
  //! Vector of measurements
  t_Vector target_;

  //! \brief Calls FB
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  //! \param[in] residuals: initial residuals
  Diagnostic operator()(t_Vector &out, t_Vector const &guess, t_Vector const &res) const;

  //! Calls l1 proximal operator, checking for real constraints and tight frame
  template <class T0, class T1>
  typename proximal::L1<Scalar>::Diagnostic l1_proximal(Eigen::MatrixBase<T0> &out, Real gamma,
                                                        Eigen::MatrixBase<T1> const &x) const {
    return l1_proximal_real_constraint()
               ? call_l1_proximal(out, gamma, x.real().template cast<typename T1::Scalar>())
               : call_l1_proximal(out, gamma, x);
  }

  //! Calls l1 proximal operator, checking for thight frame
  template <class T0, class T1>
  typename proximal::L1<Scalar>::Diagnostic call_l1_proximal(Eigen::MatrixBase<T0> &out, Real gamma,
                                                             Eigen::MatrixBase<T1> const &x) const {
    if (tight_frame()) {
      l1_proximal().tight_frame(out, gamma, x);
      return {0, 0, l1_proximal().objective(x, out, gamma), true};
    }
    return l1_proximal()(out, gamma, x);
  }

  //! Helper function to simplify checking convergence
  bool residual_convergence(t_Vector const &x, t_Vector const &residual) const;

  //! Helper function to simplify checking convergence
  bool objective_convergence(ScalarRelativeVariation<Scalar> &scalvar, t_Vector const &x,
                             t_Vector const &residual) const;

  //! Helper function to simplify checking convergence
  bool is_converged(ScalarRelativeVariation<Scalar> &scalvar, t_Vector const &x,
                    t_Vector const &residual) const;
};

template <class SCALAR>
typename ImagingForwardBackward<SCALAR>::Diagnostic ImagingForwardBackward<SCALAR>::operator()(
    t_Vector &out, t_Vector const &guess, t_Vector const &res) const {
  SOPT_HIGH_LOG("Performing Foward Backward with L1 operator");
  // The g proximal is an L1 proximal that stores some diagnostic result
  Diagnostic result;
  auto const g_proximal = [this, &result](t_Vector &out, Real gamma, t_Vector const &x) {
    result.l1_diagnostic = this->l1_proximal(out, gamma, x);
  };
  ScalarRelativeVariation<Scalar> scalvar(relative_variation(), relative_variation(),
                                          "Objective function");
  auto const convergence = [this, scalvar](t_Vector const &x, t_Vector const &residual) mutable {
    return this->is_converged(scalvar, x, residual);
  };
  auto const fb = ForwardBackward<SCALAR>(g_proximal, target())
                      .itermax(itermax())
                      .beta(beta())
                      .mu(mu())
                      .sigma(sigma())
                      .PhiTPhi(PhiTPhi())
                      .is_converged(convergence);
  static_cast<typename FB::Diagnostic &>(result) = fb(out, std::tie(guess, res));
  return result;
}

template <class SCALAR>
bool ImagingForwardBackward<SCALAR>::residual_convergence(t_Vector const &x,
                                                          t_Vector const &residual) const {
  if (static_cast<bool>(residual_convergence())) return residual_convergence()(x, residual);
  if (residual_tolerance() <= 0e0) return true;
  auto const residual_norm = sopt::l2_norm(residual);
  SOPT_LOW_LOG("    - [FB] Residuals: {} <? {}", residual_norm, residual_tolerance());
  return residual_norm < residual_tolerance();
};

template <class SCALAR>
bool ImagingForwardBackward<SCALAR>::objective_convergence(ScalarRelativeVariation<Scalar> &scalvar,
                                                           t_Vector const &x,
                                                           t_Vector const &residual) const {
  if (static_cast<bool>(objective_convergence())) return objective_convergence()(x, residual);
  if (scalvar.relative_tolerance() <= 0e0) return true;
  auto const current = sopt::l1_norm(Psi().adjoint() * x, l1_proximal_weights());
  return scalvar(current);
};

template <class SCALAR>
bool ImagingForwardBackward<SCALAR>::is_converged(ScalarRelativeVariation<Scalar> &scalvar,
                                                  t_Vector const &x,
                                                  t_Vector const &residual) const {
  auto const user = static_cast<bool>(is_converged()) == false or is_converged()(x, residual);
  auto const res = residual_convergence(x, residual);
  auto const obj = objective_convergence(scalvar, x, residual);
  // beware of short-circuiting!
  // better evaluate each convergence function everytime, especially with mpi
  return user and res and obj;
}
}  // namespace algorithm
}  // namespace sopt
#endif
