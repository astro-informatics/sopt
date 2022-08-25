#ifndef SOPT_FORWARD_BACKWARD_BASE_H
#define SOPT_FORWARD_BACKWARD_BASE_H

#include "sopt/config.h"
#include <numeric>
#include <tuple>
#include <utility>
#include "sopt/exception.h"
#include "sopt/forward_backward.h"
<<<<<<< variant A
#include "sopt/l1_proximal.h"
>>>>>>> variant B
======= end
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/proximal.h"
#include "sopt/relative_variation.h"
#include "sopt/types.h"

#ifdef SOPT_MPI
#include "sopt/mpi/communicator.h"
#include "sopt/mpi/utilities.h"
#endif

namespace sopt {
namespace algorithm {
template <class SCALAR>

class ForwardBackwardBase {
  //! Underlying algorithm
  typedef ForwardBackward<SCALAR> FB;

public:
  typedef typename FB::value_type value_type;
  typedef typename FB::Scalar Scalar;
  typedef typename FB::Real Real;
  typedef typename FB::t_Vector t_Vector;
  typedef typename FB::t_LinearTransform t_LinearTransform;
<<<<<<< variant A
  typedef typename FB::t_Proximal t_Proximal;
>>>>>>> variant B
  template <class T>
  using t_Proximal = std::function<void(t_Vector &, const T &, const t_Vector &)>;
======= end
  typedef typename FB::t_Gradient t_Gradient;
  typedef typename FB::t_IsConverged t_IsConverged;

  //! Values indicating how the algorithm ran
<<<<<<< variant A
  struct Diagnostic : public FB::Diagnostic {
    //! Diagnostic from calling L1 proximal
    typename proximal::L1<Scalar>::Diagnostic l1_diagnostic;
    Diagnostic(t_uint niters = 0u, bool good = false, typename proximal::L1<Scalar>::Diagnostic const &l1diag = typename proximal::L1<Scalar>::Diagnostic())
      : FB::Diagnostic(niters, good), l1_diagnostic(l1diag) {}
    Diagnostic(t_uint niters, bool good, typename proximal::L1<Scalar>::Diagnostic const &l1diag, t_Vector &&residual)
      : FB::Diagnostic(niters, good, std::move(residual)),l1_diagnostic(l1diag) {}
>>>>>>> variant B
  struct Diagnostic : public FB::Diagnostic {
    Diagnostic(t_uint niters = 0u, bool good = false) : FB::Diagnostic(niters, good) {}
    Diagnostic(t_uint niters, bool good, t_Vector &&residual) : FB::Diagnostic(niters, good, std::move(residual)) {}
======= end
  };
  //! Holds result vector as well
  struct DiagnosticAndResult : public Diagnostic {
    //! Output x
    t_Vector x;
  };

  //! Setups imaging wrapper for ForwardBackward
  //! \param[in] f_proximal: proximal operator of the \f$f\f$ function.
  //! \param[in] g_proximal: proximal operator of the \f$g\f$ function
  template <class DERIVED>
<<<<<<< variant A
  L1ForwardBackward(Eigen::MatrixBase<DERIVED> const &target)
      : l1_proximal_(),
>>>>>>> variant B
  L2ForwardBackward(Eigen::MatrixBase<DERIVED> const &target)
      : l2_proximal_([](t_Vector &output, const t_real &gamma, const t_Vector &x) -> void {
          proximal::l2_norm(output, gamma, x);
        }),
        l2_proximal_weighted_(
            [](t_Vector &output, const Vector<Real> &gamma, const t_Vector &x) -> void {
              proximal::l2_norm(output, gamma, x);
            }),
        l2_proximal_weights_(Vector<Real>::Ones(1)),
======= end
        l2_gradient_([](t_Vector &output, const t_Vector &x) -> void {
          output = x;
        }),  // gradient of 1/2 * x^2 = x;
        tight_frame_(false),
        residual_tolerance_(0.),
        relative_variation_(1e-4),
        residual_convergence_(nullptr),
        objective_convergence_(nullptr),
        itermax_(std::numeric_limits<t_uint>::max()),
        gamma_(1e-8),
        beta_(1),
        sigma_(1),
        nu_(1),
        is_converged_(),
        Phi_(linear_transform_identity<Scalar>()),
        target_(target) {}
  virtual ~ForwardBackwardBase() {}

// Macro helps define properties that can be initialized as in
// auto padmm = ForwardBackwardBase<float>().prop0(value).prop1(value);
#define SOPT_MACRO(NAME, TYPE)                             \
  TYPE const &NAME() const { return NAME##_; }             \
  ForwardBackwardBase<SCALAR> &NAME(TYPE const &NAME) { \
    NAME##_ = NAME;                                        \
    return *this;                                          \
  }                                                        \
                                                           \
 protected:                                                \
  TYPE NAME##_;                                            \
                                                           \
 public:

<<<<<<< variant A
  //! Maximum number of iterations
  SOPT_MACRO(l1_proximal, proximal::L1<Scalar>);
>>>>>>> variant B
  //! l2 proximal for regularizaiton
  SOPT_MACRO(l2_proximal, t_Proximal<Real>);
  //! l2 proximal for regularizaiton with weights
  SOPT_MACRO(l2_proximal_weighted, t_Proximal<Vector<Real>>);
  //! l2 proximal weights
  SOPT_MACRO(l2_proximal_weights, Vector<Real>);
======= end
  //! Gradient of the l2 norm
  SOPT_MACRO(l2_gradient, t_Gradient);
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
  //! γ parameter
  SOPT_MACRO(gamma, Real);
  //! γ parameter
  SOPT_MACRO(beta, Real);
  //! γ parameter
  SOPT_MACRO(sigma, Real);
  //! ν parameter
  SOPT_MACRO(nu, Real);
  //! A function verifying convergence
  SOPT_MACRO(is_converged, t_IsConverged);
  //! Measurement operator
  SOPT_MACRO(Phi, t_LinearTransform);
#ifdef SOPT_MPI
  //! Communicator for summing objective_function
  SOPT_MACRO(obj_comm, mpi::Communicator);
#endif

#undef SOPT_MACRO
  //! Vector of target measurements
  t_Vector const &target() const { return target_; }
  //! Minimun of objective_function
  Real objmin() const { return objmin_; };
  //! Sets the vector of target measurements
  template <class DERIVED>
  ForwardBackwardBase<Scalar> &target(Eigen::MatrixBase<DERIVED> const &target) {
    target_ = target;
    return *this;
  }

  //! \brief Calls Forward Backward
  //! \param[out] out: Output vector x
  Diagnostic operator()(t_Vector &out) const {
    return operator()(out, FB::initial_guess(target(), Phi(), nu()));
  }
  //! \brief Calls Forward Backward
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  Diagnostic operator()(t_Vector &out, std::tuple<t_Vector, t_Vector> const &guess) const {
    return operator()(out, std::get<0>(guess), std::get<1>(guess));
  }
  //! \brief Calls Forward Backward
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  Diagnostic operator()(t_Vector &out,
                        std::tuple<t_Vector const &, t_Vector const &> const &guess) const {
    return operator()(out, std::get<0>(guess), std::get<1>(guess));
  }
  //! \brief Calls Forward Backward
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()(std::tuple<t_Vector, t_Vector> const &guess) const {
    return operator()(std::tie(std::get<0>(guess), std::get<1>(guess)));
  }
  //! \brief Calls Forward Backward
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()(
      std::tuple<t_Vector const &, t_Vector const &> const &guess) const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.x, guess);
    return result;
  }
  //! \brief Calls Forward Backward
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()() const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(
        result.x, FB::initial_guess(target(), Phi(), nu()));
    return result;
  }
  //! Makes it simple to chain different calls to FB
  DiagnosticAndResult operator()(DiagnosticAndResult const &warmstart) const {
    DiagnosticAndResult result = warmstart;
    static_cast<Diagnostic &>(result) = operator()(result.x, warmstart.x, warmstart.residual);
    return result;
  }

  //! Set Φ and Φ^† using arguments that sopt::linear_transform understands
  template <class... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, ForwardBackwardBase &>::type Phi(
      ARGS &&... args) {
    Phi_ = linear_transform(std::forward<ARGS>(args)...);
    return *this;
  }

  //! \brief L1 proximal used during calculation
  //! \details Non-const version to setup the object.
<<<<<<< variant A
  proximal::L1<Scalar> &l1_proximal() { return l1_proximal_; }
>>>>>>> variant B
  t_Proximal<Real> &l2_proximal() { return l2_proximal_; }
  t_Proximal<Vector<Real>> &l2_proximal_weighted() { return l2_proximal_weighted_; }
======= end
  //! \brief Proximal of the L2 ball
  //! \details Non-const version to setup the object.
  t_Gradient &l2_graident() { return l2_gradient_; }

<<<<<<< variant A
  //! \brief Analysis operator Ψ
  //! \details Under-the-hood, the object is actually owned by the L1 proximal.
  t_LinearTransform const &Psi() const { return l1_proximal().Psi(); }
  //! Analysis operator Ψ
  template <class... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, L1ForwardBackward<Scalar> &>::type Psi(
      ARGS &&... args) {
    l1_proximal().Psi(std::forward<ARGS>(args)...);
    return *this;
  }

// Forwards get/setters to L1 and L2Ball proximals
// In practice, we end up with a bunch of functions that make it simpler to set or get values
// associated with the two proximal operators.
// E.g.: `paddm.l1_proximal_itermax(100).l2ball_epsilon(1e-2).l1_proximal_tolerance(1e-4)`.
// ~~~
#define SOPT_MACRO(VAR, NAME, PROXIMAL)                                                            \
  /** \brief Forwards to l1_proximal **/                                                           \
  decltype(std::declval<proximal::PROXIMAL<Scalar> const>().VAR()) NAME##_proximal_##VAR() const { \
    return NAME##_proximal().VAR();                                                                \
  }                                                                                                \
  /** \brief Forwards to l1_proximal **/                                                           \
  L1ForwardBackward<Scalar> &NAME##_proximal_##VAR(                                           \
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

>>>>>>> variant B
======= end
  //! Helper function to set-up default residual convergence function
  ForwardBackwardBase<Scalar> &residual_convergence(Real const &tolerance) {
    return residual_convergence(nullptr).residual_tolerance(tolerance);
  }
  //! Helper function to set-up default residual convergence function
  ForwardBackwardBase<Scalar> &objective_convergence(Real const &tolerance) {
    return objective_convergence(nullptr).relative_variation(tolerance);
  }
  //! Convergence function that takes only the output as argument
  ForwardBackwardBase<Scalar> &is_converged(std::function<bool(t_Vector const &x)> const &func) {
    return is_converged([func](t_Vector const &x, t_Vector const &) { return func(x); });
  }

 protected:
  //! Vector of measurements
  t_Vector target_;
  //! Mininum of objective function
  mutable Real objmin_;

  //! \brief Calls Forward Backward
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  //! \param[in] residuals: initial residuals
  Diagnostic operator()(t_Vector &out, t_Vector const &guess, t_Vector const &res) const;

<<<<<<< variant A
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

>>>>>>> variant B
======= end
  //! Helper function to simplify checking convergence
  bool residual_convergence(t_Vector const &x, t_Vector const &residual) const;

  //! Helper function to simplify checking convergence
  bool objective_convergence(ScalarRelativeVariation<Scalar> &scalvar, t_Vector const &x,
                             t_Vector const &residual) const;
#ifdef SOPT_MPI
  //! Helper function to simplify checking convergence
  bool objective_convergence(mpi::Communicator const &obj_comm,
                             ScalarRelativeVariation<Scalar> &scalvar, t_Vector const &x,
                             t_Vector const &residual) const;
#endif

  //! Helper function to simplify checking convergence
  bool is_converged(ScalarRelativeVariation<Scalar> &scalvar, t_Vector const &x,
                    t_Vector const &residual) const;
};

template <class SCALAR>
<<<<<<< variant A
typename L1ForwardBackward<SCALAR>::Diagnostic L1ForwardBackward<SCALAR>::operator()(
>>>>>>> variant B
typename L2ForwardBackward<SCALAR>::Diagnostic L2ForwardBackward<SCALAR>::operator()(
======= end
    t_Vector &out, t_Vector const &guess, t_Vector const &res) const {
<<<<<<< variant A
  SOPT_HIGH_LOG("Performing Forward Backward with L1 and L2 norms");
  // The f proximal is an L1 proximal that stores some diagnostic result
>>>>>>> variant B
  SOPT_HIGH_LOG("Performing Forward Backward with L2 and L2 norms");
  // The f proximal is an L2 proximal
======= end
  Diagnostic result;
<<<<<<< variant A
  auto const g_proximal = [this, &result](t_Vector &out, Real gamma, t_Vector const &x) {
    result.l1_diagnostic = this->l1_proximal(out, gamma, x);
>>>>>>> variant B
  auto const g_proximal = [this](t_Vector &out, Real gamma, t_Vector const &x) {
    if (this->l2_proximal_weights().size() > 1)
      this->l2_proximal_weighted()(out, this->l2_proximal_weights() * gamma, x);
    else
      this->l2_proximal()(out, this->l2_proximal_weights()(0) * gamma, x);
======= end
  };
  const Real sigma_factor = sigma() * sigma();
  auto const f_gradient = [this, sigma_factor](t_Vector &out, t_Vector const &x) {
    this->l2_gradient()(out, x / sigma_factor);
  };
  ScalarRelativeVariation<Scalar> scalvar(relative_variation(), relative_variation(),
                                          "Objective function");
  auto const convergence = [this, &scalvar](t_Vector const &x, t_Vector const &residual) mutable {
    const bool result = this->is_converged(scalvar, x, residual);
    this->objmin_ = std::real(scalvar.previous());
    return result;
  };
  auto const fb = FB(f_gradient, g_proximal, target())
                      .itermax(itermax())
                      .beta(beta())
                      .gamma(gamma())
                      .nu(nu())
                      .Phi(Phi())
                      .is_converged(convergence);
  static_cast<typename FB::Diagnostic &>(result) =
      fb(out, std::tie(guess, res));
  return result;
}

template <class SCALAR>
bool ForwardBackwardBase<SCALAR>::residual_convergence(t_Vector const &x,
						       t_Vector const &residual) const {
  if (static_cast<bool>(residual_convergence())) return residual_convergence()(x, residual);
  if (residual_tolerance() <= 0e0) return true;
  auto const residual_norm = sopt::l2_norm(residual);
  SOPT_LOW_LOG("    - [FB] Residuals: {} <? {}", residual_norm, residual_tolerance());
  return residual_norm < residual_tolerance();
};

template <class SCALAR>
<<<<<<< variant A
bool L1ForwardBackward<SCALAR>::objective_convergence(ScalarRelativeVariation<Scalar> &scalvar,
>>>>>>> variant B
bool L2ForwardBackward<SCALAR>::objective_convergence(ScalarRelativeVariation<Scalar> &scalvar,
======= end
                                                           t_Vector const &x,
                                                           t_Vector const &residual) const {
  if (static_cast<bool>(objective_convergence())) return objective_convergence()(x, residual);
  if (scalvar.relative_tolerance() <= 0e0) return true;
<<<<<<< variant A
  auto const current = ((gamma() > 0) ? sopt::l1_norm(static_cast<t_Vector>(Psi().adjoint() * x),
                                                      l1_proximal_weights()) *
                                            gamma()
                                      : 0) +
>>>>>>> variant B
  auto const current = ((gamma() > 0) ? sopt::l2_norm(x, l2_proximal_weights()) * gamma() : 0) +
======= end
                       std::pow(sopt::l2_norm(residual), 2) / (2 * sigma() * sigma());
  return scalvar(current);
};

#ifdef SOPT_MPI
template <class SCALAR>
<<<<<<< variant A
bool L1ForwardBackward<SCALAR>::objective_convergence(mpi::Communicator const &obj_comm,
>>>>>>> variant B
bool L2ForwardBackward<SCALAR>::objective_convergence(mpi::Communicator const &obj_comm,
======= end
                                                           ScalarRelativeVariation<Scalar> &scalvar,
                                                           t_Vector const &x,
                                                           t_Vector const &residual) const {
  if (static_cast<bool>(objective_convergence())) return objective_convergence()(x, residual);
  if (scalvar.relative_tolerance() <= 0e0) return true;
  auto const current = obj_comm.all_sum_all<t_real>(
<<<<<<< variant A
      ((gamma() > 0)
           ? sopt::l1_norm(static_cast<t_Vector>(Psi().adjoint() * x), l1_proximal_weights()) *
                 gamma()
           : 0) +
>>>>>>> variant B
      ((gamma() > 0) ? sopt::l2_norm(x, l2_proximal_weights()) * gamma() : 0) +
======= end
      std::pow(sopt::l2_norm(residual), 2) / (2 * sigma() * sigma()));
  return scalvar(current);
};
#endif

template <class SCALAR>
bool ForwardBackwardBase<SCALAR>::is_converged(ScalarRelativeVariation<Scalar> &scalvar,
                                                  t_Vector const &x,
                                                  t_Vector const &residual) const {
  auto const user = static_cast<bool>(is_converged()) == false or is_converged()(x, residual);
  auto const res = residual_convergence(x, residual);
#ifdef SOPT_MPI
  auto const obj = objective_convergence(obj_comm(), scalvar, x, residual);
#else
  auto const obj = objective_convergence(scalvar, x, residual);
#endif
  // beware of short-circuiting!
  // better evaluate each convergence function everytime, especially with mpi
  return user and res and obj;
}
}  // namespace algorithm
}  // namespace sopt
#endif
