#ifndef DIFFERENTIABLE_FUNC_H
#define DIFFERENTIABLE_FUNC_H

#include "sopt/forward_backward.h"

// Abstract base class providing the interface for differentiable functions f(x)
// with a defined gradient.
template <typename SCALAR> class DifferentiableFunc
{

public:
  using FB = sopt::algorithm::ForwardBackward<SCALAR>;
  using Real = typename FB::Real;
  using t_Vector = typename FB::t_Vector;
  using t_Gradient = typename FB::t_Gradient;
  using t_LinearTransform = typename FB::t_LinearTransform;

    // A function that prints a log message
  virtual void log_message() const = 0;

  // Return a function representing the proximal operator for this function.
  // Function must be of type t_Proximal, that is
  // void proximal_operator(Vector, real, Vector)
  virtual t_Gradient gradient()
  {
    return [this](t_Vector &output, const t_Vector &image, const t_Vector &residual,
                  const t_LinearTransform &Phi) -> void { this->gradient(output, image, residual, Phi); };
  }

  // Calculate the gradient directly
  virtual void gradient(t_Vector &output, const t_Vector &image, const t_Vector &residual,
                        const t_LinearTransform &Phi) = 0;

  // Calculate the function directly
  virtual Real function(t_Vector const &image, t_Vector const &y, t_LinearTransform const &Phi) = 0;

  // Transforms input image to a different basis.
  // Return linear_transform_identity() if transform not necessary.
  //virtual const t_LinearTransform &Phi() const = 0;

};

#endif