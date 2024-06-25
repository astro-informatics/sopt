#ifndef SOPT_NON_DIFFERENTIABLE_FUNC_H
#define SOPT_NON_DIFFERENTIABLE_FUNC_H

#include <numeric>
#include <tuple>
#include <utility>
#include "sopt/forward_backward.h"

// Abstract base class providing the interface for non differentiable functions g(x)
// with a proximal operator.
template <typename SCALAR> class NonDifferentiableFunc {

public:
  using FB = sopt::algorithm::ForwardBackward<SCALAR>;
  using Real = typename FB::Real;
  using t_Vector = typename FB::t_Vector;
  using t_Proximal = typename FB::t_Proximal;
  using t_LinearTransform = typename FB::t_LinearTransform;

  // A function that prints a log message
  virtual void log_message() const = 0;

  // Return a function representing the proximal operator for this function.
  // Function must be of type t_Proximal, that is
  // void proximal_operator(Vector, real, Vector)
  virtual t_Proximal proximal_operator() const = 0;

  // Returns the function itself
  virtual Real function(t_Vector const &x) const = 0;

  // Transforms input image to a different basis.
  // Return linear_transform_identity() if transform not necessary.
  virtual const t_LinearTransform &Psi() const = 0;
  
}; // class NonDifferentiableFunc
#endif
