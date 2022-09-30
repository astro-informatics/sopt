#ifndef SOPT_G_PROXIMAL_H
#define SOPT_G_PROXIMAL_H

#include "sopt/config.h"
#include <numeric>
#include <tuple>
#include <utility>
#include "sopt/forward_backward.h"

// Abstract base class providing the interface to the g_proximal function
template <class SCALAR> class GProximal {

  typedef ForwardBackward<SCALAR> FB;
  typedef typename FB::Real Real;
  typedef typename FB::t_Vector t_Vector;
  typedef typename FB::t_Proximal t_Proximal;
  
public:

  // Getter and setter for Analysis Operator Psi in the proximal object
  virtual t_LinearTransform const &Psi() const = 0;
  template <class... ARGS> virtual void &Psi(ARGS &&... args) = 0;
  
  virtual void log_message() const = 0;
  virtual t_Proximal proximal_function() const = 0;
  virtual Real proximal_norm(t_Vector const &x) const = 0;
  
} // class GProximal
#endif
