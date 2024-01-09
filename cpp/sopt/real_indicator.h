#ifndef SOPT_PROJECTION_PROXIMAL_H
#define SOPT_PROJECTION_PROXIMAL_H

#include "sopt/g_proximal.h"
#include "sopt/linear_transform.h"

// Implementation of real indicator (non differentiable) function
// The proximal operator is just a real projection
// interface defined by NonDifferentiableFunc class
// Psi from the base class is redundant in this case
template <typename SCALAR>
class RealIndicator : public NonDifferentiableFunc<SCALAR>
{
    public: 
    using NDF = NonDifferentiableFunc<SCALAR>;

    void log_message() const override
    {
        SOPT_HIGH_LOG("Performing Forward Backward TensorFlow model");
    }

    // Indicator function
    NDF::Real function(NDF::t_Vector const &x) const override
    {
        return ((x.imag() != 0).any()) ? 0 : 1;
    }

    // Real projection
    NDF::t_Proximal proximal_operator() const override
    {
        return [this](t_Vector &out, Real gamma, t_Vector const &image) {
	     out = image.real();
	   };
    }

    // Return the identity by default since the Psi operator
    // should not be used in this case
    NDF::t_LinearTransform const &Psi() const override
    {
        return sopt::linear_transform_identity<SCALAR>();
    }
};

#endif