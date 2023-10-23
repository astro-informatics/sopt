#ifndef SOPT_GRADIENT_DESCENT_H
#define SOPT_GRADIENT_DESCENT_H

#include <functional>
#include "sopt/linear_transform.h"
#include "sopt/types.h"

namespace sopt::algorithm {

//! \brief Pure gradient descent algorithm
//! \details Requires \f$\grad f, \grad g\f$ be analytically defined.
//! \f$x_{n+1} = x_n + \alpha R(\grad f(x_n, y)) + \lambda \grad(g(\mu x_n))\f$
//! \param f_gradient: Gradient function for f, where f is usually a likelihood. Takes two arguments(x, y). 
//! \param g_gradient: Gradient function for g, where g is usually a prior / regulator. Takes one argument (x). 
//! \param lambda: multiplier for g gradient function 
//! \param Lipschitz_f: Lipschitz constant of function f (used to calculated alpha) 
//! \param Lipschitz_g: Lipschitz constant of function g (used to calculated alpha) 
//! \param mu: Scaling parameter for vector inside g. Also used to calculate alpha
template <typename SCALAR>
class GradientDescent 
{
 public:
  using F_Gradient =
      typename std::function<Vector<SCALAR>(const Vector<SCALAR> &, const Vector<SCALAR> &)>;
  using G_Gradient = typename std::function<Vector<SCALAR>(const Vector<SCALAR> &)>;
  using REAL = typename real_type<SCALAR>::type;

  template <typename DERIVED>
  GradientDescent(F_Gradient const &f_gradient, G_Gradient const &g_gradient,
                  Eigen::MatrixBase<DERIVED> const &target,
                  LinearTransform<Vector<SCALAR>> const &measurement_operator, REAL mu, REAL lambda,
                  REAL Lipschitz_f, REAL Lipschitz_g, REAL delta_converged)
      : mu(mu),
        Lipschitz_f(Lipschitz_f),
        Lipschitz_g(Lipschitz_g),
        lambda(lambda),
        Phi(measurement_operator),
        threshold_delta(delta_converged),
        f_gradient(f_gradient),
        g_gradient(g_gradient)
  {
    alpha = 0.98 / (Lipschitz_f + mu * lambda * Lipschitz_g);
  }

 protected:
  LinearTransform<Vector<SCALAR>> Phi;
  F_Gradient f_gradient;
  G_Gradient g_gradient;
  REAL alpha;
  REAL lambda;
  REAL mu;
  REAL Lipschitz_f;
  REAL Lipschitz_g;
  Vector<SCALAR> target;
  REAL threshold_delta;
  Vector<SCALAR> delta_x;
  REAL theta_now;
  REAL theta_next;
  Vector<SCALAR> x_prev;
  uint max_iterations;

  void iteration_step(Vector<SCALAR> &x, Vector<SCALAR> &z)
  {
    // Should be able to make this better to avoid copies
    x_prev = x;

    delta_x = f_gradient(z, target).real();
    delta_x += lambda * g_gradient(mu * z);
    delta_x *= alpha;

    theta_next = 0.5 * (1 + sqrt(1 + 4*theta_now*theta_now));

    x = z - delta_x;
    z = x + (theta_now - 1)/ theta_next * (x - x_prev);
  }

  bool converged(Vector<SCALAR> &x)
  {
    return (delta_x.norm() / x.norm()) < threshold_delta; 
  }

  void operator()(Vector<SCALAR> &x, Vector<SCALAR> &residual)
  {
    Vector<SCALAR> z = x;
    bool converged = False;
    for (uint i = 0; i < max_iterations; i++)
    {
      iteration_step(x, z);
      
      converged = converged(x);
      if(converged) break;
    }

    if(converged)
    {
      // TODO: Log some relevant stuff about the convergence.
    }

    residual = (Phi * x) - target;
  }

};

}  // namespace sopt::algorithm

#endif  // SOPT_GRADIENT_DESCENT_H