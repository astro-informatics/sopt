#ifndef SOPT_IMAGING_FORWARD_BACKWARD_H
#define SOPT_IMAGING_FORWARD_BACKWARD_H

#include "sopt/config.h"
#include <limits> // for std::numeric_limits<>
#include <memory> // for std::shared_ptr<>
#include <numeric>
#include <tuple>
#include <utility>
#include "sopt/exception.h"
#include "sopt/forward_backward.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/proximal.h"
#include "sopt/relative_variation.h"
#include "sopt/types.h"
#include "sopt/non_differentiable_func.h"
#include "sopt/differentiable_func.h"

#ifdef SOPT_MPI
#include "sopt/mpi/communicator.h"
#include "sopt/mpi/utilities.h"
#endif

namespace sopt::algorithm {
template <typename SCALAR>
class ImagingForwardBackward {
  //! Underlying algorithm
  using FB = ForwardBackward<SCALAR>;

 public:
  using value_type = typename FB::value_type;
  using Scalar = typename FB::Scalar;
  using Real = typename FB::Real;
  using t_Vector = typename FB::t_Vector;
  using t_LinearTransform = typename FB::t_LinearTransform;
  using t_Proximal = typename FB::t_Proximal;
  using t_Gradient = typename FB::t_Gradient;
  using t_l2Gradient = typename std::function<void(t_Vector &, const t_Vector &)>;
  using t_IsConverged = typename FB::t_IsConverged;

  //! Values indicating how the algorithm ran
  struct Diagnostic : public FB::Diagnostic {
    Diagnostic(t_uint niters = 0u, bool good = false) : FB::Diagnostic(niters, good) {}
    Diagnostic(t_uint niters, bool good, t_Vector &&residual)
      : FB::Diagnostic(niters, good, std::move(residual)) {}
  };

  //! Holds result vector as well
  struct DiagnosticAndResult : public Diagnostic {
    //! Output x
    t_Vector x;
  };

  //! Sets up imaging wrapper for ForwardBackward. Sets g_function_ to null to avoid
  //! having a dependency on the implementation of g_function. The correct implementation
  //! should be injected by the code that instantiates this class.
  // Note: Using setter injection instead of constructior injection to follow the
  // style in the rest of the class, although constructor might be more appropriate
  // In this problem we assume an objective function \f$f(x, y, \Phi) + g(x)\f$ where 
  // \f$f\f$ is differentiable with a supplied gradient and \f$g\f$ is non-differentiable with a supplied proximal operator.
  // Throughout this class we will use `f` and `g` in variables to refer to these two parts of the objective function.
  //! \param[in] target: Vector of target measurements
  template <typename DERIVED>
  ImagingForwardBackward(Eigen::MatrixBase<DERIVED> const &target)
      : g_function_(nullptr),
        f_function_(nullptr),
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
        fista_(true),
        is_converged_(),
        Phi_(linear_transform_identity<Scalar>()),
        target_(target) {}
  virtual ~ImagingForwardBackward() {}

// Macro helps define properties that can be initialized as in
// auto padmm = ImagingForwardBackward<float>().prop0(value).prop1(value);
#define SOPT_MACRO(NAME, TYPE)                             \
  TYPE const &NAME() const { return NAME##_; }             \
  ImagingForwardBackward<SCALAR> &NAME(TYPE const &(NAME)) { \
    NAME##_ = NAME;                                        \
    return *this;                                          \
  }                                                        \
                                                           \
 protected:                                                \
  TYPE NAME##_;                                            \
                                                           \
 public:

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
  //! flag to for FISTA Forward-Backward algorithm. True by default but should be false when using a learned g_function.
  SOPT_MACRO(fista, bool);
  //! A function verifying convergence
  SOPT_MACRO(is_converged, t_IsConverged);
  //! Measurement operator
  SOPT_MACRO(Phi, t_LinearTransform);

#ifdef SOPT_MPI
  //! Communicator for summing objective_function
  SOPT_MACRO(obj_comm, mpi::Communicator);
  SOPT_MACRO(adjoint_space_comm, mpi::Communicator);
#endif

#undef SOPT_MACRO

  // Getter and setter for the g_function object
  // The getter of g_function can not return a const because it will be used
  // to call setters of its internal properties
  std::shared_ptr<NonDifferentiableFunc<SCALAR>> g_function() { return g_function_; }
  ImagingForwardBackward<SCALAR>& g_function( std::shared_ptr<NonDifferentiableFunc<SCALAR>> g_function) {
    g_function_ = std::move(g_function);
    return *this;
  }

  // Getter and setter for the f_function object
  // The getter of f_function can not return a const because it will be used
  // to call setters of its internal properties
  std::shared_ptr<DifferentiableFunc<SCALAR>> f_function() { return f_function_; }
  ImagingForwardBackward<SCALAR>& f_function( std::shared_ptr<DifferentiableFunc<SCALAR>> f_function) {
    f_function_ = std::move(f_function);
    return *this;
  }

  t_LinearTransform const &Psi() const
  {
    return (g_function_) ? g_function_->Psi() : linear_transform_identity<Scalar>();
  }

  // Default f_gradient is gradient of l2-norm
  // This gradient ignores x and is based only on residual. (x is required for other forms of gradient)
  //t_Gradient f_gradient;

  //void set_f_gradient(const t_Gradient &fgrad)
  //{
  //  f_gradient = fgrad;
  //}

  //! Vector of target measurements
  t_Vector const &target() const { return target_; }

  //! Minimum of objective_function
  Real objmin() const { return objmin_; }
  //! Sets the vector of target measurements
  template <typename DERIVED>
  ImagingForwardBackward<Scalar> &target(Eigen::MatrixBase<DERIVED> const &target) {
    target_ = target;
    return *this;
  }

  //! \brief Calls Forward Backward
  //! \param[out] out: Output vector x
  Diagnostic operator()(t_Vector &out) const {
    return operator()(out, ForwardBackward<SCALAR>::initial_guess(target(), Phi(), nu()));
  }
  //! \brief Calls Forward Backward
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  Diagnostic operator()(t_Vector &out, std::tuple<t_Vector, t_Vector> const &guess)  {
    return operator()(out, std::get<0>(guess), std::get<1>(guess));
  }
  //! \brief Calls Forward Backward
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  Diagnostic operator()(t_Vector &out,
                        std::tuple<t_Vector const &, t_Vector const &> const &guess)  {
    return operator()(out, std::get<0>(guess), std::get<1>(guess));
  }
  //! \brief Calls Forward Backward
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()(std::tuple<t_Vector, t_Vector> const &guess)  {
    return operator()(std::tie(std::get<0>(guess), std::get<1>(guess)));
  }
  //! \brief Calls Forward Backward
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()(
      std::tuple<t_Vector const &, t_Vector const &> const &guess)  {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.x, guess);
    return result;
  }
  //! \brief Calls Forward Backward
  //! \param[in] guess: initial guess
  DiagnosticAndResult operator()()  {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(
        result.x, ForwardBackward<SCALAR>::initial_guess(target(), Phi(), nu()));
    return result;
  }
  //! Makes it simple to chain different calls to FB
  DiagnosticAndResult operator()(DiagnosticAndResult const &warmstart)  {
    DiagnosticAndResult result = warmstart;
    static_cast<Diagnostic &>(result) = operator()(result.x, warmstart.x, warmstart.residual);
    return result;
  }

  //! Set Φ and Φ^† using arguments that sopt::linear_transform understands
  template <typename... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, ImagingForwardBackward &>::type Phi(
      ARGS &&... args) {
    Phi_ = linear_transform(std::forward<ARGS>(args)...);
    return *this;
  }

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

 protected:

  // Store a pointer of the abstract base classes DifferentiableFunc & NonDifferentiableFunction type for f and g
  // These should point to an instance of a derived class (e.g. L1GProximal) once set up
  std::shared_ptr<NonDifferentiableFunc<SCALAR>> g_function_;
  std::shared_ptr<DifferentiableFunc<SCALAR>> f_function_;

  //! Vector of measurements
  t_Vector target_;
  //! Mininum of objective function
  mutable Real objmin_;

  //! \brief Calls Forward Backward
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  //! \param[in] residuals: initial residuals
  Diagnostic operator()(t_Vector &out, t_Vector const &guess, t_Vector const &res) ;

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

template <typename SCALAR>
typename ImagingForwardBackward<SCALAR>::Diagnostic ImagingForwardBackward<SCALAR>::operator()(
    t_Vector &out, t_Vector const &guess, t_Vector const &res) {
  if(!g_function_)
  {
    throw std::runtime_error("Non-differentiable function `g` has not been set. You must set it with `g_function()` before calling the algorithm.");
  }
  g_function_->log_message();
  Diagnostic result;
  auto const g_proximal = g_function_->proximal_operator();
  t_Gradient f_gradient;
  if(f_function_) f_gradient = f_function_->gradient();
  if(!f_gradient)
  {
    SOPT_HIGH_LOG("Gradient function has not been set; using default (gaussian likelihood) gradient. (To set a custom gradient set_gradient() must be called before the algorithm is run.)");
    f_gradient = [this](t_Vector &output, t_Vector const &x, t_Vector const &residual, t_LinearTransform const &Phi) {
      output = Phi.adjoint() * (residual / (this->sigma() * this->sigma()));
    };
  }
  ScalarRelativeVariation<Scalar> scalvar(relative_variation(), relative_variation(),
                                          "Objective function");
  auto const convergence = [this, &scalvar](t_Vector const &x, t_Vector const &residual) mutable {
    const bool result = this->is_converged(scalvar, x, residual);
    this->objmin_ = std::real(scalvar.previous());
    return result;
  };
  auto const fb = ForwardBackward<SCALAR>(f_gradient, g_proximal, target())
                      .itermax(itermax())
                      .beta(beta())
                      .gamma(gamma())
                      .nu(nu())
                      .fista(fista())
                      .Phi(Phi())
                      .is_converged(convergence);
  static_cast<typename ForwardBackward<SCALAR>::Diagnostic &>(result) =
      fb(out, std::tie(guess, res));
  return result;
}

template <typename SCALAR>
bool ImagingForwardBackward<SCALAR>::residual_convergence(t_Vector const &x,
                                                          t_Vector const &residual) const {
  if (static_cast<bool>(residual_convergence())) return residual_convergence()(x, residual);
  if (residual_tolerance() <= 0e0) return true;
  auto const residual_norm = sopt::l2_norm(residual);
  SOPT_LOW_LOG("    - [FB] Residuals: {} <? {}", residual_norm, residual_tolerance());
  return residual_norm < residual_tolerance();
}

template <typename SCALAR>
bool ImagingForwardBackward<SCALAR>::objective_convergence(ScalarRelativeVariation<Scalar> &scalvar,
                                                           t_Vector const &x,
                                                           t_Vector const &residual) const {
  if (static_cast<bool>(objective_convergence())) return objective_convergence()(x, residual);
  if (scalvar.relative_tolerance() <= 0e0) return true;
  auto const current = ((gamma() > 0) ? g_function_->function(x)
			* gamma() : 0) + std::pow(sopt::l2_norm(residual), 2) / (2 * sigma() * sigma());
  return scalvar(current);
}

#ifdef SOPT_MPI
template <typename SCALAR>
bool ImagingForwardBackward<SCALAR>::objective_convergence(mpi::Communicator const &obj_comm,
                                                           ScalarRelativeVariation<Scalar> &scalvar,
                                                           t_Vector const &x,
                                                           t_Vector const &residual) const {
  if (static_cast<bool>(objective_convergence())) return objective_convergence()(x, residual);
  if (scalvar.relative_tolerance() <= 0e0) return true;
  auto const current = obj_comm.all_sum_all<t_real>(
	((gamma() > 0) ? g_function_->function(x)
       * gamma() : 0) + std::pow(sopt::l2_norm(residual), 2) / (2 * sigma_ * sigma_));
  return scalvar(current);
}
#endif

template <typename SCALAR>
bool ImagingForwardBackward<SCALAR>::is_converged(ScalarRelativeVariation<Scalar> &scalvar,
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
} // namespace sopt::algorithm
#endif
