#ifndef SOPT_G_PROXIMAL_H
#define SOPT_G_PROXIMAL_H

#include <numeric>
#include <tuple>
#include <utility>
#include "sopt/forward_backward.h"

// Abstract base class providing the interface to the g_proximal function
template <class SCALAR> class GProximal {

  using FB = sopt::algorithm::ForwardBackward<SCALAR>;
  using Real = typename FB::Real;
  using t_Vector = typename FB::t_Vector;
  using t_Proximal = typename FB::t_Proximal;
  using t_LinearTransform = typename FB::t_LinearTransform;
  
public:

  // A function that prints a log message
  virtual void log_message() const = 0;
  // A function that returns a function for the g_proximal.
  // Function must be of type t_Proximal, that is
  // void proximal_function(Vector, real, Vector)
  virtual t_Proximal proximal_function() const = 0;
  // Returns the norm of x
  virtual Real proximal_norm(t_Vector const &x) const = 0;
  // Transforms input image to a different basis.
  // Return linear_transform_identity() if transform not necessary.
  virtual const t_LinearTransform &Psi() const = 0;
}; // class GProximal
#endif
