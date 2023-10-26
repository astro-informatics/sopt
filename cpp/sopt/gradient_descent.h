#ifndef SOPT_GRADIENT_DESCENT_H
#define SOPT_GRADIENT_DESCENT_H

#include <functional>
#include "sopt/linear_transform.h"
#include "sopt/types.h"

namespace sopt::algorithm {

  //! Values indicating how the algorithm ran
  template <typename SCALAR>
  struct AlgorithmResults {
    //! Number of iterations
    t_uint niters;
    //! Wether convergence was achieved
    bool good;
    //! the residual from the last iteration
    Vector<SCALAR> residual;
    Vector<SCALAR> result;
  };

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

  GradientDescent(F_Gradient const &f_gradient,
                  G_Gradient const &g_gradient,
                  Vector<SCALAR> const &target,
                  REAL const threshold,
                  REAL const Lipschitz_f = 1,
                  REAL const Lipschitz_g = 1,
                  REAL const mu = 1,
                  REAL const lambda = 1)
      : Phi(linear_transform_identity<SCALAR>()),
        f_gradient(f_gradient),
        g_gradient(g_gradient),
        target(target),
        Lipschitz_f(Lipschitz_f),
        Lipschitz_g(Lipschitz_g),
        threshold_delta(threshold)
  {
    alpha = 0.98 / (Lipschitz_f + mu * lambda * Lipschitz_g);
  }

  AlgorithmResults<SCALAR> operator()(Vector<SCALAR> &x)
  {
    Vector<SCALAR> z = x;
    bool converged = false;
    uint iterations = 0;
    while ((!converged) && (iterations < max_iterations))
    {
      iteration_step(x, z);
      
      converged = is_converged(x);

      ++iterations;
    }

    if(converged)
    {
      // TODO: Log some relevant stuff about the convergence.
    }

    AlgorithmResults<SCALAR> results;
    results.good = converged;
    results.niters = iterations;
    results.residual = (Phi * x) - target;
    results.result = z;

    return results;
  }

 protected:
  LinearTransform<Vector<SCALAR>> Phi;
  F_Gradient f_gradient;
  G_Gradient g_gradient;
  REAL alpha;
  REAL lambda = 1;
  REAL mu = 1;
  REAL Lipschitz_f = 1;
  REAL Lipschitz_g = 1;
  Vector<SCALAR> target;
  REAL threshold_delta;
  Vector<SCALAR> delta_x;
  REAL theta_now;
  REAL theta_next;
  Vector<SCALAR> x_prev;
  uint max_iterations = 200;

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

  bool is_converged(Vector<SCALAR> &x)
  {
    return (delta_x.norm() / x.norm()) < threshold_delta; 
  }

};

}  // namespace sopt::algorithm

#endif  // SOPT_GRADIENT_DESCENT_H