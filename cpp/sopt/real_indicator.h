#ifndef SOPT_PROJECTION_PROXIMAL_H
#define SOPT_PROJECTION_PROXIMAL_H

#include "sopt/non_differentiable_func.h"
#include "sopt/linear_transform.h"
#include <complex>

namespace sopt::algorithm {

// Implementation of real indicator (non differentiable) function
// The proximal operator is just a real projection
// interface defined by NonDifferentiableFunc class
// Psi from the base class is redundant in this case
template <typename SCALAR>
class RealIndicator : public NonDifferentiableFunc<SCALAR>
{
    public: 
    using NDF = NonDifferentiableFunc<SCALAR>;
    using Real = typename NDF::Real;
    using t_Vector = typename NDF::t_Vector;
    using t_Proximal = typename NDF::t_Proximal;
    using t_LinearTransform = typename NDF::t_LinearTransform;

    RealIndicator() {}

    void log_message() const override
    {
        SOPT_HIGH_LOG("Using Real Indicator for g(x)");
    }
    
    // Indicator function. This is usually only used for the 
    // objective function, so this will probably not be called.
    Real function(t_Vector const &x) const override;

    // Real projection
    t_Proximal proximal_operator() const override
    {
        return [this](t_Vector &out, Real gamma, t_Vector const &image) {
	     out = image.real();
	   };
    }

    // Return the identity by default since the Psi operator
    // should not be used in this case
    t_LinearTransform const &Psi() const override
    {
        return linear_operator;
    }

    t_LinearTransform linear_operator = sopt::linear_transform_identity<SCALAR>();
};

template<typename SCALAR>
typename RealIndicator<SCALAR>::Real RealIndicator<SCALAR>::function(typename RealIndicator<SCALAR>::t_Vector const &x) const
{
  if constexpr (std::is_same<SCALAR, sopt::t_complex>::value)
  {
    for (auto &z : x) {
      if (z.imag() != 0) {
        SOPT_HIGH_LOG("Non-real vector in real indicator function; real projection has not been properly performed.");
        return 1;  // should in principle be inf but not sure how to model this
      }
    }
  }
  return 0;
}

}

#endif