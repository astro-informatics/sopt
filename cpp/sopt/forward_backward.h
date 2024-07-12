#ifndef SOPT_FORWARD_BACKWARD_H
#define SOPT_FORWARD_BACKWARD_H

#include "sopt/config.h"
#include <functional>
#include <limits>
#include <tuple> // for tuple<>
#include <utility> // for std::move<>
#include "sopt/exception.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/types.h"

namespace sopt::algorithm {

/*! \brief Forward Backward Splitting 
  \An optimisation method to solve the problem \f$y = \Phi(x) + N(\sigma)\f
  \f$\min_{x} f(x, y, \Phi) + g(x)\f$. \f$y\f$ is a target vector, while x is the current solution.
  \f$f$ is a differentiable function. It is necessary to supply the gradient. 
  \f$f$ is represented using a DifferentiableFunc object, which supplies the function and its gradient.
  \f$g$ is a non-differentiable function. It is necessary to supply a proximal operator (or similar stepping function e.g. tensor-flow denoiser).
  \f$g$ is represented using a NonDifferentiableFunc object, which supplies the function and its proximal operator.
*/
template <typename SCALAR>
class ForwardBackward {
 public:
  //! Scalar type
  using value_type = SCALAR;
  //! Scalar type
  using Scalar = value_type;
  //! Real type
  using Real = typename real_type<Scalar>::type;
  //! Type of then underlying vectors
  using t_Vector = Vector<Scalar>;
  //! Type of the Ψ and Ψ^H operations, as well as Φ and Φ^H
  using t_LinearTransform = LinearTransform<t_Vector>;
  //! Type of the convergence function
  using t_IsConverged = std::function<bool(const t_Vector &, const t_Vector &)>;
  //! Type of the proximal operator
  using t_Proximal = ProximalFunction<Scalar>;
  //! Type of the gradient
  // The first argument is the output vector, the others are inputs
  using t_Gradient = std::function<void(t_Vector &gradient, const t_Vector &image, const t_Vector &residual, const t_LinearTransform& Phi)>;

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

  //! Setups ForwardBackward
  //! \param[in] f_function: the differentiable function \f$f\f$ with a gradient
  //! \param[in] g_function: the non-differentiable function \f$g\f$ with a proximal operator
  template <typename DERIVED>
  ForwardBackward(t_Gradient const &f_gradient, t_Proximal const &g_proximal,
                  Eigen::MatrixBase<DERIVED> const &target)
      : itermax_(std::numeric_limits<t_uint>::max()),
        gamma_(1e-8),
        beta_(1),
        nu_(1),
        is_converged_(),
	      fista_(true),
        Phi_(linear_transform_identity<Scalar>()),
        f_gradient_(f_gradient),
        g_proximal_(g_proximal),
        target_(target) {}
  virtual ~ForwardBackward() {}

// Macro helps define properties that can be initialized as in
// auto sdmm  = ForwardBackward<float>().prop0(value).prop1(value);
#define SOPT_MACRO(NAME, TYPE)                      \
  TYPE const &NAME() const { return NAME##_; }      \
  ForwardBackward<SCALAR> &NAME(TYPE const &(NAME)) { \
    NAME##_ = NAME;                                 \
    return *this;                                   \
  }                                                 \
                                                    \
 protected:                                         \
  TYPE NAME##_;                                     \
                                                    \
 public:

  //! Maximum number of iterations
  SOPT_MACRO(itermax, t_uint);
  //! γ parameter
  SOPT_MACRO(gamma, Real);
  //! β parameter
  SOPT_MACRO(beta, Real);
  //! ν parameter
  SOPT_MACRO(nu, Real);
  //! flag to for FISTA Forward-Backward algorithm. True by default but should be false when using a learned g_proximal.
  SOPT_MACRO(fista, bool);
  //! \brief A function verifying convergence
  //! \details It takes as input two arguments: the current solution x and the current residual.
  SOPT_MACRO(is_converged, t_IsConverged);
  //! Measurement operator
  SOPT_MACRO(Phi, t_LinearTransform);
  //! First proximal
  SOPT_MACRO(f_gradient, t_Gradient);
  //! Second proximal
  SOPT_MACRO(g_proximal, t_Proximal);
#undef SOPT_MACRO
  //! \brief Simplifies calling the gradient function
  void f_gradient(t_Vector &out, t_Vector const &x, t_Vector const &res, t_LinearTransform const &Phi) const { f_gradient()(out, x, res, Phi); }
  //! \brief Simplifies calling the proximal function
  void g_proximal(t_Vector &out, Real gamma, t_Vector const &x) const {
    g_proximal()(out, gamma, x);
  }

  //! Convergence function that takes only the output as argument
  ForwardBackward<Scalar> &is_converged(std::function<bool(t_Vector const &x)> const &func) {
    return is_converged([func](t_Vector const &x, t_Vector const &) { return func(x); });
  }

  //! Vector of target measurements
  t_Vector const &target() const { return target_; }
  //! Sets the vector of target measurements
  template <typename DERIVED>
  ForwardBackward<Scalar> &target(Eigen::MatrixBase<DERIVED> const &target) {
    target_ = target;
    return *this;
  }

  //! Facilitates call to user-provided convergence function
  bool is_converged(t_Vector const &x, t_Vector const &residual) const {
    return static_cast<bool>(is_converged()) and is_converged()(x, residual);
  }

  //! \brief Calls Forward Backward
  //! \param[out] out: Output vector x
  Diagnostic operator()(t_Vector &out) const { return operator()(out, initial_guess()); }
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
    static_cast<Diagnostic &>(result) = operator()(result.x, initial_guess());
    return result;
  }
  //! Makes it simple to chain different calls to FB
  DiagnosticAndResult operator()(DiagnosticAndResult const &warmstart) const {
    DiagnosticAndResult result = warmstart;
    static_cast<Diagnostic &>(result) = operator()(result.x, warmstart.x, warmstart.residual);
    return result;
  }
  //! Set Φ and Φ^† using arguments that sopt::linear_transform understands
  template <typename... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, ForwardBackward &>::type Phi(ARGS &&... args) {
    Phi_ = linear_transform(std::forward<ARGS>(args)...);
    return *this;
  }

  //! \brief Computes initial guess for x and the residual using the targets
  //! \details with y the vector of measurements
  //! - x = Φ^T y / ν
  //! - residuals = Φ x - y
  std::tuple<t_Vector, t_Vector> initial_guess() const {
    return ForwardBackward<SCALAR>::initial_guess(target(), Phi(), nu());
  }

  //! \brief Computes initial guess for x and the residual using the targets
  //! \details with y the vector of measurements
  //! - x = Φ^T y / ν
  //! - residuals = Φ x - y
  //!
  //! This function simplifies creating overloads for operator() in FB wrappers.
  static std::tuple<t_Vector, t_Vector> initial_guess(t_Vector const &target,
                                                      t_LinearTransform const &phi, Real nu) {
    std::tuple<t_Vector, t_Vector> guess;
    std::get<0>(guess) = static_cast<t_Vector>(phi.adjoint() * target) / nu;
    std::get<1>(guess) = phi * std::get<0>(guess) - target;
    return guess;
  }

 protected:
  void iteration_step(t_Vector &out, t_Vector &residual, t_Vector &p, t_Vector &z,
                      const t_real lambda) const;

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

  //! \brief Calls Forward Backward
  //! \param[out] out: Output vector x
  //! \param[in] guess: initial guess
  //! \param[in] residuals: initial residuals
  Diagnostic operator()(t_Vector &out, t_Vector const &guess, t_Vector const &res) const;

  //! Vector of measurements
  t_Vector target_;
};

template <typename SCALAR>
void ForwardBackward<SCALAR>::iteration_step(t_Vector &image_new, t_Vector &residual, t_Vector &image_current,
                                             t_Vector &gradient_current, const t_real FISTA_ratio) const {
  image_current = image_new;
  SOPT_LOW_LOG("Calculate gradient");
  f_gradient(gradient_current, image_current, residual, Phi());  // takes residual and calculates the grad = 1/sig^2 residual
  SOPT_LOW_LOG("Take a gradient step");
  image_new = image_current - beta() / nu() * gradient_current;  // step to new image using gradient
  SOPT_LOW_LOG("Calculate the weight");
  const Real weight = gamma() * beta();
  SOPT_LOW_LOG("Apply proximal operator");
  g_proximal(image_new, weight, image_new);  // apply proximal operator to new image
  SOPT_LOW_LOG("FISTA acceleration step");
  image_current = image_new + FISTA_ratio * (image_new - image_current);  // FISTA acceleration step  
  SOPT_LOW_LOG("Calculate the residual");
  residual = (Phi() * image_current) - target();  // calculates the residual for the NEXT iteration.
}

template <typename SCALAR>
typename ForwardBackward<SCALAR>::Diagnostic ForwardBackward<SCALAR>::operator()(
    t_Vector &out, t_Vector const &x_guess, t_Vector const &res_guess) const {
  SOPT_HIGH_LOG("Performing Forward Backward Splitting");
  if (fista()) {
    SOPT_HIGH_LOG("Using FISTA algorithm");
  } else {
    SOPT_HIGH_LOG("Using standard FB algorithm");
  }
  sanity_check(x_guess, res_guess);

  const uint image_size = x_guess.size();

  t_Vector image_current = x_guess;
  t_Vector residual = res_guess;
  t_Vector gradient_current = t_Vector::Zero(image_size);
  out = x_guess;

  t_uint niters(0);
  bool converged = false;
  Real theta = 1.0;
  Real theta_new = 1.0;
  Real FISTA_ratio = 0.0;
  for (; (not converged) && (niters < itermax()); ++niters) {
    SOPT_HIGH_LOG("    - [FB] Iteration {}/{}", niters, itermax());
    if (fista()) {
      theta_new = (1 + std::sqrt(1 + 4 * theta * theta)) / 2.;
      FISTA_ratio = (theta - 1) / (theta_new);
      theta = theta_new;
    }
    SOPT_HIGH_LOG("      - Call iteration step");
    iteration_step(out, residual, image_current, gradient_current, FISTA_ratio);
    SOPT_HIGH_LOG("      - [FB] Sum of residuals: {}", residual.array().abs().sum());
    converged = is_converged(out, residual);
  }

  if (converged) {
    SOPT_HIGH_LOG("    - [FB] converged in {} of {} iterations", niters, itermax());
  } else if (static_cast<bool>(is_converged())) {
    // not meaningful if not convergence function
    SOPT_ERROR("    - [FB] did not converge within {} iterations", itermax());
  }
  return {niters, converged, std::move(residual)};
}
} // namespace sopt::algorithm
#endif
