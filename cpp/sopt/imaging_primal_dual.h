#ifndef SOPT_L1_PRIMAL_DUAL_H
#define SOPT_L1_PRIMAL_DUAL_H

#include "sopt/config.h"
#include <numeric>
#include <tuple>
#include <utility>
#include "sopt/exception.h"
#include "sopt/l1_proximal.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/primal_dual.h"
#include "sopt/proximal.h"
#include "sopt/relative_variation.h"
#include "sopt/types.h"

namespace sopt::algorithm {
template <class SCALAR>
class ImagingPrimalDual {
  //! Underlying algorithm
  using PD = PrimalDual<SCALAR>;

 public:
  using value_type = typename PD::value_type;
  using Scalar = typename PD::Scalar;
  using Real = typename PD::Real;
  using t_Vector = typename PD::t_Vector;
  using t_LinearTransform = typename PD::t_LinearTransform;
  template <class T>
  using t_Proximal = std::function<void(t_Vector &, const T &, const t_Vector &)>;
  using t_IsConverged = typename PD::t_IsConverged;
  using t_Constraint = typename PD::t_Constraint;
  using t_Random_Updater = typename PD::t_Random_Updater;

  //! Values indicating how the algorithm ran
  struct Diagnostic : public PD::Diagnostic {
    Diagnostic(t_uint niters = 0u, bool good = false) : PD::Diagnostic(niters, good) {}
    Diagnostic(t_uint niters, bool good, t_Vector &&residual)
        : PD::Diagnostic(niters, good, std::move(residual)) {}
  };
  //! Holds result vector as well
  struct DiagnosticAndResult : public Diagnostic {
    //! Output x
    t_Vector x;
  };

  //! Setups imaging wrapper for PD
  //! \param[in] f_proximal: proximal operator of the \f$f\f$ function.
  //! \param[in] g_proximal: proximal operator of the \f$g\f$ function
  template <class DERIVED>
  ImagingPrimalDual(Eigen::MatrixBase<DERIVED> const &target)
      : l1_proximal_([](t_Vector &out, const Real &gamma, const t_Vector &x) {
          proximal::l1_norm<t_Vector, t_Vector>(out, gamma, x);
        }),
        l1_proximal_weighted_([](t_Vector &out, const Vector<Real> &gamma, const t_Vector &x) {
          proximal::l1_norm<t_Vector, t_Vector, Vector<Real>>(out, gamma, x);
        }),
        l1_proximal_weights_(Vector<Real>::Ones(1)),
        l2ball_proximal_(1e0),
        residual_tolerance_(1e-4),
        relative_variation_(1e-4),
        residual_convergence_(nullptr),
        objective_convergence_(nullptr),
        itermax_(std::numeric_limits<t_uint>::max()),
        sigma_(1),
        tau_(0.5),
        gamma_(0.5),
        update_scale_(1),
        precondition_stepsize_(0.5),
        precondition_weights_(t_Vector::Ones(target.size())),
        precondition_iters_(0),
        xi_(1),
        rho_(1),
        nu_(1),
        is_converged_(),
        Phi_(linear_transform_identity<Scalar>()),
        Psi_(linear_transform_identity<Scalar>()),
        random_measurement_updater_([]() { return true; }),
        random_wavelet_updater_([]() { return true; }),
        target_(target) {}
  virtual ~ImagingPrimalDual() {}

// Macro helps define properties that can be initialized as in
// auto padmm = ImagingPrimalDual<float>().prop0(value).prop1(value);
#define SOPT_MACRO(NAME, TYPE)                        \
  TYPE const &NAME() const { return NAME##_; }        \
  ImagingPrimalDual<SCALAR> &NAME(TYPE const &(NAME)) { \
    NAME##_ = NAME;                                   \
    return *this;                                     \
  }                                                   \
                                                      \
 protected:                                           \
  TYPE NAME##_;                                       \
                                                      \
 public:
  ImagingPrimalDual * g_proximal(){ return this;}
  //! The l1 prox functioning as f
  SOPT_MACRO(l1_proximal, t_Proximal<Real>);
  //! The l1 prox with weights functioning as f
  SOPT_MACRO(l1_proximal_weighted, t_Proximal<Vector<Real>>);
  //! The l1 prox weights functioning
  SOPT_MACRO(l1_proximal_weights, Vector<Real>);
  //! The weighted L2 proximal functioning as g
  SOPT_MACRO(l2ball_proximal, proximal::WeightedL2Ball<Scalar>);
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
  //! gamma parameter
  SOPT_MACRO(gamma, Real);
  //! update parameter
  SOPT_MACRO(update_scale, Real);
  //! Apply positivity constraint
  SOPT_MACRO(positivity_constraint, bool);
  //! Apply real constraint
  SOPT_MACRO(real_constraint, bool);
  //! sigma parameter
  SOPT_MACRO(sigma, Real);
  //! tau parameter
  SOPT_MACRO(tau, Real);
  //! xi parameter
  SOPT_MACRO(xi, Real);
  //! rho parameter
  SOPT_MACRO(rho, Real);
  //! ν parameter
  SOPT_MACRO(nu, Real);
  //! precondtion step size parameter
  SOPT_MACRO(precondition_stepsize, Real);
  //! precondition weights parameter
  SOPT_MACRO(precondition_weights, t_Vector);
  //! precondition iterations parameter
  SOPT_MACRO(precondition_iters, t_uint);
  //! A function verifying convergence
  SOPT_MACRO(is_converged, t_IsConverged);
  //! Measurement operator
  SOPT_MACRO(Phi, t_LinearTransform);
  //! Wavelet operator
  SOPT_MACRO(Psi, t_LinearTransform);
  //! lambda that determines if to update measurements
  SOPT_MACRO(random_measurement_updater, t_Random_Updater);
  //! lambda that determines if to update wavelets
  SOPT_MACRO(random_wavelet_updater, t_Random_Updater);
#ifdef SOPT_MPI
  //!
  SOPT_MACRO(v_all_sum_all_comm, mpi::Communicator);
  //!
  SOPT_MACRO(u_all_sum_all_comm, mpi::Communicator);
#endif

#undef SOPT_MACRO
  //! Vector of target measurements
  t_Vector const &target() const { return target_; }
  //! Sets the vector of target measurements
  template <class DERIVED>
  ImagingPrimalDual<Scalar> &target(Eigen::MatrixBase<DERIVED> const &target) {
    target_ = target;
    return *this;
  }

  //! \brief Calls Primal Dual
  //! \param[out] out: Output vector x
  Diagnostic operator()(t_Vector &out) const {
    return operator()(out, PD::initial_guess(target(), Phi(), nu()));
  }
  //! \brief Calls Primal Dual
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  Diagnostic operator()(t_Vector &out, std::tuple<t_Vector, t_Vector> const &guess) const {
    return operator()(out, std::get<0>(guess), std::get<1>(guess));
  }
  //! \brief Calls Primal Dual
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  Diagnostic operator()(t_Vector &out,
                        std::tuple<t_Vector const &, t_Vector const &> const &guess) const {
    return operator()(out, std::get<0>(guess), std::get<1>(guess));
  }
  //! \brief Calls Primal Dual
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()(std::tuple<t_Vector, t_Vector> const &guess) const {
    return operator()(std::tie(std::get<0>(guess), std::get<1>(guess)));
  }
  //! \brief Calls Primal Dual
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()(
      std::tuple<t_Vector const &, t_Vector const &> const &guess) const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.x, guess);
    return result;
  }
  //! \brief Calls Primal Dual
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()() const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.x,
                                                   PD::initial_guess(target(), Phi(), nu()));
    return result;
  }
  //! Makes it simple to chain different calls to PD
  DiagnosticAndResult operator()(DiagnosticAndResult const &warmstart) const {
    DiagnosticAndResult result = warmstart;
    static_cast<Diagnostic &>(result) = operator()(result.x, warmstart.x, warmstart.residual);
    return result;
  }

  //! Set Φ and Φ^† using arguments that sopt::linear_transform understands
  template <class... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, ImagingPrimalDual &>::type Phi(ARGS &&... args) {
    Phi_ = linear_transform(std::forward<ARGS>(args)...);
    return *this;
  }

  //! \brief Proximal of the L2 ball
  //! \details Non-const version to setup the object.
  proximal::WeightedL2Ball<Scalar> &l2ball_proximal() { return l2ball_proximal_; }

  //! Analysis operator Ψ
  template <class... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, ImagingPrimalDual &>::type Psi(ARGS &&... args) {
    Psi_ = linear_transform(std::forward<ARGS>(args)...);
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
  ImagingPrimalDual<Scalar> &NAME##_proximal_##VAR(                                                \
      decltype(std::declval<proximal::PROXIMAL<Scalar> const>().VAR()) (VAR)) {                      \
    NAME##_proximal().VAR(VAR);                                                                    \
    return *this;                                                                                  \
  }
  SOPT_MACRO(epsilon, l2ball, WeightedL2Ball);
  SOPT_MACRO(weights, l2ball, WeightedL2Ball);
#ifdef SOPT_MPI
  SOPT_MACRO(communicator, l2ball, WeightedL2Ball);
#endif
#undef SOPT_MACRO

  //! Helper function to set-up default residual convergence function
  ImagingPrimalDual<Scalar> &residual_convergence(Real const &tolerance) {
    return residual_convergence(nullptr).residual_tolerance(tolerance);
  }
  //! Helper function to set-up default residual convergence function
  ImagingPrimalDual<Scalar> &objective_convergence(Real const &tolerance) {
    return objective_convergence(nullptr).relative_variation(tolerance);
  }
  //! Convergence function that takes only the output as argument
  ImagingPrimalDual<Scalar> &is_converged(std::function<bool(t_Vector const &x)> const &func) {
    return is_converged([func](t_Vector const &x, t_Vector const &) { return func(x); });
  }

 protected:
  //! Vector of measurements
  t_Vector target_;

  //! \brief Calls Primal Dual
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  //! \param[in] residuals: initial residuals
  Diagnostic operator()(t_Vector &out, t_Vector const &guess, t_Vector const &res) const;

  //! Helper function to simplify checking convergence
  bool residual_convergence(t_Vector const &x, t_Vector const &residual) const;

  //! Helper function to simplify checking convergence
  bool objective_convergence(ScalarRelativeVariation<Scalar> &scalvar, t_Vector const &x,
                             t_Vector const &residual) const;

  //! Helper function to simplify checking convergence
  bool is_converged(ScalarRelativeVariation<Scalar> &scalvar, t_Vector const &x,
                    t_Vector const &residual) const;
  //! check that l1 and weighted l1 proximal operators are the same function (except for weights)
  bool check_l1_weight_proximal(const t_Proximal<Real> &no_weights,
                                const t_Proximal<Vector<Real>> &with_weights) const {
    const Vector<SCALAR> x = Vector<SCALAR>::Ones(this->l1_proximal_weights().size());
    Vector<SCALAR> output = Vector<SCALAR>::Zero(this->l1_proximal_weights().size());
    Vector<SCALAR> outputw = Vector<SCALAR>::Zero(this->l1_proximal_weights().size());
    no_weights(output, 1, x);
    with_weights(outputw, Vector<Real>::Ones(this->l1_proximal_weights().size()), x);
    return output.isApprox(outputw);
  };
};

template <class SCALAR>
typename ImagingPrimalDual<SCALAR>::Diagnostic ImagingPrimalDual<SCALAR>::operator()(
    t_Vector &out, t_Vector const &guess, t_Vector const &res) const {
  SOPT_HIGH_LOG("Performing Primal Dual with L1 and L2 operators");
  // The f proximal is an L1 proximal that stores some diagnostic result
  if (not check_l1_weight_proximal(l1_proximal(), l1_proximal_weighted()))
    SOPT_THROW(
        "l1 proximal and weighted l1 proximal appear to be different functions. Please make sure "
        "both are the same function.");
  auto const f_proximal = [this](t_Vector &out, Real gamma, t_Vector const &x) {
    if (this->l1_proximal_weights().size() > 1)
      this->l1_proximal_weighted()(out, this->l1_proximal_weights() * gamma, x);
    else
      this->l1_proximal()(out, this->l1_proximal_weights()(0) * gamma, x);
  };
  auto const g_proximal = [this](t_Vector &out, Real gamma, t_Vector const &x) {
    this->l2ball_proximal()(out, gamma, x);
    // applying preconditioning
    for (t_int i = 0; i < this->precondition_iters(); i++)
      this->l2ball_proximal()(
          out, gamma,
          out - this->precondition_stepsize() *
                    (out.array() * this->precondition_weights().array() - x.array()).matrix());

    if (this->precondition_iters() > 0) out = out.array() * this->precondition_weights().array();
  };
  ScalarRelativeVariation<Scalar> scalvar(relative_variation(), relative_variation(),
                                          "Objective function");
  auto const convergence = [this, scalvar](t_Vector const &x, t_Vector const &residual) mutable {
    return this->is_converged(scalvar, x, residual);
  };
  const bool positive = positivity_constraint();
  const bool real = real_constraint();
  t_Constraint constraint = [real, positive](t_Vector &out, const t_Vector &x) {
    if (real) out.real() = x.real();
    if (positive) out = sopt::positive_quadrant(x);
    if (not real and not positive) out = x;
  };
  auto const pd = PD(f_proximal, g_proximal, target())
                      .itermax(itermax())
                      .constraint(constraint)
                      .sigma(sigma())
                      .tau(tau())
                      .gamma(gamma())
                      .update_scale(update_scale())
                      .xi(xi())
                      .rho(rho())
                      .nu(nu())
                      .gamma(gamma())
                      .Phi(Phi())
                      .Psi(Psi())
                      .random_measurement_updater(random_measurement_updater())
                      .random_wavelet_updater(random_wavelet_updater())
#ifdef SOPT_MPI
                      .v_all_sum_all_comm(v_all_sum_all_comm())
                      .u_all_sum_all_comm(u_all_sum_all_comm())
#endif
                      .is_converged(convergence);
  Diagnostic result;
  static_cast<typename PD::Diagnostic &>(result) = pd(out, std::tie(guess, res));
  return result;
}

template <class SCALAR>
bool ImagingPrimalDual<SCALAR>::residual_convergence(t_Vector const &x,
                                                     t_Vector const &residual) const {
  if (static_cast<bool>(residual_convergence())) return residual_convergence()(x, residual);
  if (residual_tolerance() <= 0e0) return true;
  auto const residual_norm = sopt::l2_norm(residual, l2ball_proximal_weights());
  SOPT_LOW_LOG("    - [Primal Dual] Residuals: {} <? {}", residual_norm, residual_tolerance());
  return residual_norm < residual_tolerance();
};

template <class SCALAR>
bool ImagingPrimalDual<SCALAR>::objective_convergence(ScalarRelativeVariation<Scalar> &scalvar,
                                                      t_Vector const &x,
                                                      t_Vector const &residual) const {
  if (static_cast<bool>(objective_convergence())) return objective_convergence()(x, residual);
  if (scalvar.relative_tolerance() <= 0e0) return true;
  auto const current =
      sopt::l1_norm(static_cast<t_Vector>(Psi().adjoint() * x), l1_proximal_weights());
  return scalvar(current);
};

template <class SCALAR>
bool ImagingPrimalDual<SCALAR>::is_converged(ScalarRelativeVariation<Scalar> &scalvar,
                                             t_Vector const &x, t_Vector const &residual) const {
  auto const user = static_cast<bool>(is_converged()) == false or is_converged()(x, residual);
  auto const res = residual_convergence(x, residual);
  auto const obj = objective_convergence(scalvar, x, residual);
  // beware of short-circuiting!
  // better evaluate each convergence function everytime, especially with mpi
  return user and res and obj;
}
} // namespace sopt::algorithm
#endif
