#ifndef SOPT_PRIMAL_DUAL_H
#define SOPT_PRIMAL_DUAL_H

#include "sopt/config.h"
#include <functional>
#include <limits>
#include "sopt/exception.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/types.h"

namespace sopt {
namespace algorithm {

//! \brief Primal Dual Algorithm
//! \details \f$\min_{x, z} f(x) + h(z)\f$ subject to \f$Φx + z = y\f$. \f$y\f$ is a target vector.
template <class SCALAR>
class PrimalDual {
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
  typedef std::function<bool(t_Vector const &, t_Vector const &)> t_IsConverged;
  //! Type of the constraint function
  typedef std::function<void(t_Vector &, const t_Vector &)> t_Constraint;
  //! Type of the convergence function
  typedef ProximalFunction<Scalar> t_Proximal;

  //! Values indicating how the algorithm ran
  struct Diagnostic {
    //! Number of iterations
    t_uint niters;
    //! Wether convergence was achieved
    bool good;
    //! the residual from the last iteration
    t_Vector residual;

    Diagnostic(t_uint niters = 0u, bool good = false)
        : niters(niters), good(good), residual(t_Vector::Zero(0)) {}
    Diagnostic(t_uint niters, bool good, t_Vector &&residual)
        : niters(niters), good(good), residual(std::move(residual)) {}
  };
  //! Holds result vector as well
  struct DiagnosticAndResult : public Diagnostic {
    //! Output x
    t_Vector x;
  };

  //! Setups PrimalDual
  //! \param[in] f_proximal: proximal operator of the \f$f\f$ function.
  //! \param[in] g_proximal: proximal operator of the \f$g\f$ function
  template <class DERIVED>
  PrimalDual(t_Proximal const &f_proximal, t_Proximal const &g_proximal,
             Eigen::MatrixBase<DERIVED> const &target)
      : itermax_(std::numeric_limits<t_uint>::max()),
        sigma_(1),
        tau_(0.5),
        gamma_(0.5),
        update_scale_(1),
        xi_(1),
        rho_(1),
        nu_(1),
        is_converged_(),
        constraint_([](t_Vector &out, t_Vector const &x) { out = x; }),
        Phi_(linear_transform_identity<Scalar>()),
        Psi_(linear_transform_identity<Scalar>()),
        f_proximal_(f_proximal),
        g_proximal_(g_proximal),
        target_(target) {}
  virtual ~PrimalDual() {}

// Macro helps define properties that can be initialized as in
// auto sdmm  = PrimalDual<float>().prop0(value).prop1(value);
#define SOPT_MACRO(NAME, TYPE)                 \
  TYPE const &NAME() const { return NAME##_; } \
  PrimalDual<SCALAR> &NAME(TYPE const &NAME) { \
    NAME##_ = NAME;                            \
    return *this;                              \
  }                                            \
                                               \
 protected:                                    \
  TYPE NAME##_;                                \
                                               \
 public:

  //! Maximum number of iterations
  SOPT_MACRO(itermax, t_uint);
  //! Update parameter
  SOPT_MACRO(update_scale, Real);
  //! γ parameter
  SOPT_MACRO(gamma, Real);
  //! sigma parameter
  SOPT_MACRO(sigma, Real);
  //! xi parameter
  SOPT_MACRO(xi, Real);
  //! rho parameter
  SOPT_MACRO(rho, Real);
  //! tau parameter
  SOPT_MACRO(tau, Real);
  //! ν parameter
  SOPT_MACRO(nu, Real);
  //! \brief A function verifying convergence
  //! \details It takes as input two arguments: the current solution x and the current residual.
  SOPT_MACRO(is_converged, t_IsConverged);
  //! \brief A function applying a simple constraint
  SOPT_MACRO(constraint, t_Constraint);
  //! Measurement operator
  SOPT_MACRO(Phi, t_LinearTransform);
  //! Wavelet operator
  SOPT_MACRO(Psi, t_LinearTransform);
  //! First proximal
  SOPT_MACRO(f_proximal, t_Proximal);
  //! Second proximal
  SOPT_MACRO(g_proximal, t_Proximal);
#undef SOPT_MACRO
  //! \brief Simplifies calling the proximal of f.
  void f_proximal(t_Vector &out, Real gamma, t_Vector const &x) const {
    f_proximal()(out, gamma, x);
  }
  //! \brief Simplifies calling the proximal of f.
  void g_proximal(t_Vector &out, Real gamma, t_Vector const &x) const {
    g_proximal()(out, gamma, x);
  }

  //! Convergence function that takes only the output as argument
  PrimalDual<Scalar> &is_converged(std::function<bool(t_Vector const &x)> const &func) {
    return is_converged([func](t_Vector const &x, t_Vector const &) { return func(x); });
  }

  //! Vector of target measurements
  t_Vector const &target() const { return target_; }
  //! Sets the vector of target measurements
  template <class DERIVED>
  PrimalDual<Scalar> &target(Eigen::MatrixBase<DERIVED> const &target) {
    target_ = target;
    return *this;
  }

  //! Facilitates call to user-provided convergence function
  bool is_converged(t_Vector const &x, t_Vector const &residual) const {
    return static_cast<bool>(is_converged()) and is_converged()(x, residual);
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
    static_cast<Diagnostic &>(result) = operator()(result.x, initial_guess());
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
  typename std::enable_if<sizeof...(ARGS) >= 1, PrimalDual &>::type Phi(ARGS &&... args) {
    Phi_ = linear_transform(std::forward<ARGS>(args)...);
    return *this;
  }
  //! Set Φ and Φ^† using arguments that sopt::linear_transform understands
  template <class... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, PrimalDual &>::type Psi(ARGS &&... args) {
    Psi_ = linear_transform(std::forward<ARGS>(args)...);
    return *this;
  }

  //! \brief Computes initial guess for x and the residual using the targets
  //! \details with y the vector of measurements
  //! - x = Φ^T y / ν
  //! - residuals = Φ x - y
  std::tuple<t_Vector, t_Vector> initial_guess() const {
    return PrimalDual<SCALAR>::initial_guess(target(), Phi(), nu());
  }

  //! \brief Computes initial guess for x and the residual using the targets
  //! \details with y the vector of measurements
  //! - x = Φ^T y / ν
  //! - residuals = Φ x - y
  //!
  //! This function simplifies creating overloads for operator() in PD wrappers.
  static std::tuple<t_Vector, t_Vector> initial_guess(t_Vector const &target,
                                                      t_LinearTransform const &phi, Real nu) {
    std::tuple<t_Vector, t_Vector> guess;
    std::get<0>(guess) = phi.adjoint() * target / nu;
    std::get<1>(guess) = phi * std::get<0>(guess) - target;
    return guess;
  }

 protected:
  void iteration_step(t_Vector &out, t_Vector &out_hold, t_Vector &u, t_Vector &u_hold, t_Vector &v,
                      t_Vector &v_hold, t_Vector &residual, t_Vector &q, t_Vector &r) const;

  //! Checks input makes sense
  void sanity_check(t_Vector const &x_guess, t_Vector const &res_guess) const {
    if ((Phi().adjoint() * target()).size() != x_guess.size())
      SOPT_THROW("target, adjoint measurement operator and input vector have inconsistent sizes");
    if (target().size() != res_guess.size())
      SOPT_THROW("target and residual vector have inconsistent sizes");
    if ((Phi() * x_guess).size() != target().size())
      SOPT_THROW("target, measurement operator and input vector have inconsistent sizes");
    if (not static_cast<bool>(is_converged()))
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
void PrimalDual<SCALAR>::iteration_step(t_Vector &out, t_Vector &out_hold, t_Vector &u,
                                        t_Vector &u_hold, t_Vector &v, t_Vector &v_hold,
                                        t_Vector &residual, t_Vector &q, t_Vector &r) const {
  // dual calculations for measurements
  g_proximal(v_hold, rho(), v + residual);
  v_hold = v + residual - v_hold;
  v = v + update_scale() * (v_hold - v);

  // dual calculations for wavelet
  q = Psi().adjoint() * out_hold;
  f_proximal(u_hold, gamma(), u + q);
  u_hold = u + q - u_hold;
  u = u + update_scale() * (u_hold - u);
  // primal calculations
  r = out;
  constraint()(out_hold, r - tau() * ((Psi() * u) * sigma() + (Phi().adjoint() * v) * xi()));
  out = r + update_scale() * (out_hold - r);
  out_hold = 2 * out_hold - r;
  // update residual
  residual = Phi() * out_hold - target();
}

template <class SCALAR>
typename PrimalDual<SCALAR>::Diagnostic PrimalDual<SCALAR>::operator()(
    t_Vector &out, t_Vector const &x_guess, t_Vector const &res_guess) const {
  SOPT_HIGH_LOG("Performing Primal Dual");
  sanity_check(x_guess, res_guess);

  t_Vector residual = res_guess;
  out = x_guess;
  t_Vector out_hold = x_guess;
  t_Vector r = out;
  t_Vector v = t_Vector::Zero(target().size());
  t_Vector v_hold = t_Vector::Zero(target().size());
  t_Vector u = Psi().adjoint() * t_Vector::Zero(out.size());
  t_Vector u_hold = u;
  t_Vector q = u;

  t_uint niters(0);
  bool converged = false;
  for (; (not converged) && (niters < itermax()); ++niters) {
    SOPT_LOW_LOG("    - [Primal Dual] Iteration {}/{}", niters, itermax());
    iteration_step(out, out_hold, u, u_hold, v, v_hold, residual, q, r);
    SOPT_LOW_LOG("      - [Primal Dual] Sum of residuals: {}", residual.array().abs().sum());
    converged = is_converged(out, residual);
  }

  if (converged) {
    SOPT_MEDIUM_LOG("    - [Primal Dual] converged in {} of {} iterations", niters, itermax());
  } else if (static_cast<bool>(is_converged())) {
    // not meaningful if not convergence function
    SOPT_ERROR("    - [Primal Dual] did not converge within {} iterations", itermax());
  }
  return {niters, converged, std::move(residual)};
}
}  // namespace algorithm
}  // namespace sopt
#endif
