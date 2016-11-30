#ifndef SOPT_PRIMAL_DUAL_H
#define SOPT_PRIMAL_DUAL_H

#include "sopt/config.h"
#include <functional>
#include <limits>
#include "sopt/exception.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/types.h"
#include "sopt/l1_proximal.h"
#include "sopt/proximal.h"
#include "sopt/utilities.h"

namespace sopt {
namespace algorithm {

//! \brief Primal Dual method
//! \details This is a basic implementation of the primal dual method using a forward backwards algorithm.
//! \f$\min_{x, y, z} f(x) + l(y) + h(z)\f$ subject to \f$Φx = y\f$, \f$Ψ^Hx = z\f$
//!  We are not implementing blocking or parallelism here.
template <class SCALAR> class PrimalDual {
public:
  //! Scalar type
  typedef SCALAR value_type;
  //! Scalar type
  typedef value_type Scalar;
  //! Real type
  typedef typename real_type<Scalar>::type Real;
  //! Type of then underlying vectors
  typedef Vector<Scalar> t_Vector;
  //! Type of the Ψ and Ψ^H operations, as well as Φ and Φ^H
  typedef LinearTransform<t_Vector> t_LinearTransform;
  //! Type of the convergence function
  typedef ConvergenceFunction<Scalar> t_IsConverged;
  //! Type of the convergence function
  typedef ProximalFunction<Scalar> t_Proximal;
  typedef sopt::Matrix<Scalar> Matrix;
  //! Values indicating how the algorithm ran
  struct Diagnostic {
    //! Number of iterations
    t_uint niters;
    //! Wether convergence was achieved
    bool good;
    //! the residual from the last iteration
    t_Vector residual;

    Diagnostic(t_uint niters = 0u, bool good = false)
        : niters(niters), good(good), residual(t_Vector::Zero(1)) {}
    Diagnostic(t_uint niters, bool good, t_Vector &&residual)
        : niters(niters), good(good), residual(std::move(residual)) {}
  };
  //! Holds result vector as well
  struct DiagnosticAndResult : public Diagnostic {
    //! Output x
    t_Vector x;
  };

  //! Setups PrimalDual
  template <class DERIVED>
  PrimalDual(Eigen::MatrixBase<DERIVED> const &target)
    : itermax_(std::numeric_limits<t_uint>::max()), is_converged_(), kappa_(1), tau_(1), sigma1_(1),
      sigma2_(1), levels_(1), nu_(1), l2ball_epsilon_(1), l1_proximal_weights_(Vector<Real>::Zero(1)),
      Phi_(linear_transform_identity<Scalar>()),
      Psi_(linear_transform_identity<Scalar>()),
      residual_convergence_(1e-4), relative_variation_(1e-4), positivity_constraint_(true),
      target_(target) {}
  virtual ~PrimalDual() {}

// Macro helps define properties that can be initialized as in
// auto pd  = PrimalDual<float>().prop0(value).prop1(value);
#define SOPT_MACRO(NAME, TYPE)                                                                     \
  TYPE const &NAME() const { return NAME##_; }                                                     \
  PrimalDual<SCALAR> &NAME(TYPE const &NAME) {                                                     \
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
    //! ν parameter
  SOPT_MACRO(nu, Real);
  //! κ
  SOPT_MACRO(kappa, Real);
  //! τ
  SOPT_MACRO(tau, Real);
  //! σ
  SOPT_MACRO(sigma1, Real);
  //! ς
  SOPT_MACRO(sigma2, Real);
  //! Number of dictionaries used in the wavelet operator
  SOPT_MACRO(levels, t_uint);

  SOPT_MACRO(l1_proximal_weights, Vector<Real>);
  
  SOPT_MACRO(l2ball_epsilon, Real);
  //! A function verifying convergence
  SOPT_MACRO(is_converged, t_IsConverged);
  //! Measurement operator
  SOPT_MACRO(Phi, t_LinearTransform);
  //! Analysis operator
  SOPT_MACRO(Psi, t_LinearTransform);
  //! Convergence of the residuals
  //! If negative it is disabled
  SOPT_MACRO(residual_convergence, Real);
  //!  Convergence of the relative variation of the objective functions
  //!  If negative, this convergence criteria is disabled.
  SOPT_MACRO(relative_variation, Real);
  //! Enforce whether the result needs to be projected to the positive quadrant or not
  SOPT_MACRO(positivity_constraint, bool);


  
#undef SOPT_MACRO

  //! Vector of target measurements
  t_Vector const &target() const { return target_; }
  //! Sets the vector of target measurements
  template <class DERIVED> PrimalDual<DERIVED> &target(Eigen::MatrixBase<DERIVED> const &target) {
    target_ = target;
    return *this;
  }

    
  
  //! Facilitates call to user-provided convergence function
  bool is_converged(t_Vector const &x) const {
    return static_cast<bool>(is_converged()) and is_converged()(x);
  }

  
  //! \brief Calls Primal Dual
  //! \param[out] out: Output vector x
  Diagnostic operator()(t_Vector &out) const { return operator()(out, initial_guess()); }
  //! \brief Calls Primal Dual
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  Diagnostic operator()(t_Vector &out, std::tuple<t_Vector, t_Vector> const &guess) const {
    return operator()(out, std::get<0>(guess), std::get<1>(guess));
  }
  //! \brief Calls Primal Dual
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()(std::tuple<t_Vector, t_Vector> const &guess) const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.x, guess);
    return result;
  }
  //! \brief Calls Primal Dual
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()() const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.x, initial_guess());
    return result;
  }
  //! Makes it simple to chain different calls to Primal Dual
  DiagnosticAndResult operator()(DiagnosticAndResult const &warmstart) const {
    DiagnosticAndResult result = warmstart;
    static_cast<Diagnostic &>(result) = operator()(result.x, warmstart.x, warmstart.residual);
    return result;
  }
  //! \brief Analysis operator Ψ and Ψ^† 
  template <class... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, PrimalDual &>::type Psi(ARGS &&... args) {
    Psi_ = linear_transform(std::forward<ARGS>(args)...);
    return *this;
  }


  //! Set Φ and Φ^† using arguments that sopt::linear_transform understands
  template <class... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, PrimalDual &>::type Phi(ARGS &&... args) {
    Phi_ = linear_transform(std::forward<ARGS>(args)...);
    return *this;
  }
  //! \brief Computes initial guess for x and the residual
  //! \details with y the vector of measurements
  //! - x = Φ^T y
  //! - residuals = Φ x - y
  std::tuple<t_Vector, t_Vector> initial_guess() const {
    std::tuple<t_Vector, t_Vector> guess;
    std::get<0>(guess) = Phi().adjoint() * target() / nu();
    std::get<1>(guess) = Phi() * std::get<0>(guess) - target();
    return guess;
  }


protected:

  
  void iteration_step(t_Vector &out, t_Vector &residual, t_Vector &s, t_Vector &v, t_Vector &x_bar) const;

  //! Checks input makes sense
  void sanity_check(t_Vector const &x_guess, t_Vector const &res_guess) const {
    if((Phi().adjoint() * target()).size() != x_guess.size())
      SOPT_THROW("target, adjoint measurement operator and input vector have inconsistent sizes");
    if(target().size() != res_guess.size())
      SOPT_THROW("target and residual vector have inconsistent sizes");
    if((Phi() * x_guess).size() != target().size())
      SOPT_THROW("target, measurement operator and input vector have inconsistent sizes");
    if(not static_cast<bool>(is_converged()))
      SOPT_WARN("No convergence function was provided: algorithm will run for {} steps", itermax());
  }

  //! \brief Calls Primal Dual
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  //! \param[in] residuals: initial residuals
  Diagnostic operator()(t_Vector &out, t_Vector const &guess, t_Vector const &res) const;

  //! Vector of measurements
  t_Vector target_;
};

template <class SCALAR>
void PrimalDual<SCALAR>::iteration_step(t_Vector &out, t_Vector &residual, t_Vector &s,
					     t_Vector &v, t_Vector &x_bar) const {

  t_Vector prev_sol = out;
  t_Vector prev_s = s;
  t_Vector prev_v = v;

  proximal::L2Ball<Scalar> l2ball_proximal = proximal::L2Ball<Scalar>(l2ball_epsilon());
  
  // v_t = v_t-1 + Phi*x_bar - l2ball_prox(v_t-1 + Phi*x_bar)
  t_Vector temp = v + (Phi() * x_bar);
  t_Vector v_prox;
  v_prox = l2ball_proximal(0, temp-target()) + target();
  v = temp - v_prox;
  
  // s_t = s_t-1 + Psi_dagger * x_bar_t-1 - l1norm_prox(s_t-1 + Psi_dagger * x_bar_t-1)
  t_Vector temp2 = s + (Psi().adjoint() * x_bar);
  t_Vector s_prox;
  proximal::l1_norm(s_prox, kappa()/sigma1(), temp2);
  s = temp2 - s_prox;
  
  //x_t = positive orth projection(x_t-1 - tau * (sigma1 * Psi * s + sigma2 * Phi dagger * v)) 
  out = prev_sol - tau()*(Psi()*s*sigma1() + Phi().adjoint()*v*sigma2());
  if(positivity_constraint()){
    out = sopt::positive_quadrant(out);
  }
  x_bar = 2*out - prev_sol;
  residual = Phi() * out - target();
    
}

template <class SCALAR>
typename PrimalDual<SCALAR>::Diagnostic PrimalDual<SCALAR>::
operator()(t_Vector &out, t_Vector const &x_guess, t_Vector const &res_guess) const {
  SOPT_HIGH_LOG("Performing Primal Dual");
  sanity_check(x_guess, res_guess);

  proximal::L2Ball<Scalar> l2ball_proximal = proximal::L2Ball<Scalar>(l2ball_epsilon());

  // This should be number of dicitionaries times x_guess.size()
  // Should be looking up the multiplication factor from Psi
  t_Vector s = t_Vector::Zero(x_guess.size()*levels());
  t_Vector v = t_Vector::Zero(target().size());
  
  t_Vector x_bar = t_Vector::Zero(x_guess.size());
  t_Vector residual = res_guess;
  
  // Check if there is a user provided convergence function
  bool const has_user_convergence = static_cast<bool>(is_converged());
  bool converged = false;
  
  out = x_guess;
  t_uint niters(0);

  Vector<Real> l1_weights;
  
  if(l1_proximal_weights().size() == 1 && (l1_proximal_weights()(0)) == 0){
    l1_weights = Vector<Real>(1);
    l1_weights << 1.0;
  }else{
    l1_weights = l1_proximal_weights();
  }

  Vector<Real> weights(1);
  weights << 1.0;

  std::pair<Real, Real> objectives{sopt::l1_norm(Psi().adjoint() * out, l1_weights), 0};
  
  for(niters; niters < itermax(); ++niters) {
    SOPT_LOW_LOG("    - Iteration {}/{}", niters, itermax());
    iteration_step(out, residual, s, v, x_bar);
    SOPT_LOW_LOG("      - Sum of residuals: {}", residual.array().abs().sum());

    objectives.second = objectives.first;
    objectives.first = sopt::l1_norm(Psi().adjoint() * out, l1_weights);
    t_real const relative_objective
        = std::abs(objectives.first - objectives.second) / objectives.first;
    SOPT_LOW_LOG("    - objective: obj value = {}, rel obj = {}", objectives.first,
                 relative_objective);

    
    auto const residual_norm = sopt::l2_norm(residual, weights);
    SOPT_LOW_LOG("      - residual norm = {}, residual convergence = {}", residual_norm, residual_convergence());
    
    auto const user = (not has_user_convergence) or is_converged(out);
    auto const res = residual_convergence() <= 0e0 or residual_norm < residual_convergence();
    auto const rel = relative_variation() <= 0e0 or relative_objective < relative_variation();

    converged = user and res and rel;
    if(converged) {
      SOPT_MEDIUM_LOG("    - converged in {} of {} iterations", niters, itermax());
      break;
    }
  }
  // check function exists, otherwise, don't know if convergence is meaningful
  if(not converged)
    SOPT_ERROR("    - did not converge within {} iterations", itermax());
    
  return {niters, converged, std::move(residual)};
}
}
} /* sopt::algorithm */
#endif
