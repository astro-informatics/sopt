#ifndef ONNX_DIFFERENTIABLE_FUNC
#define ONNX_DIFFERENTIABLE_FUNC

#include "sopt/ort_session.h"
#include "sopt/differentiable_func.h"

namespace sopt
{


template<typename SCALAR>
class L2DifferentiableFunc : public DifferentiableFunc<SCALAR> 
{
    using t_Gradient = typename DifferentiableFunc<SCALAR>::t_Gradient;
    using Real = typename DifferentiableFunc<SCALAR>::Real;
    using Vector = typename DifferentiableFunc<SCALAR>::t_Vector;
    using LinearTransform = typename DifferentiableFunc<SCALAR>::t_LinearTransform;

    public:
    L2DifferentiableFunc (const Real sigma, 
                          const LinearTransform& Phi): LT(Phi), sigma(sigma)
    {}

    void log_message() const override
    {
        SOPT_HIGH_LOG("Using L2 differentiable function f(x)");
    }

    void gradient(Vector &output, const Vector &image, const Vector &residual,
                  const LinearTransform &Phi) const override 
    {
      output = Phi.adjoint() * (residual / (sigma * sigma));  // L2 norm
    }

    Real function(Vector const &image, Vector const &y, LinearTransform const &Phi) const override
    {
        // Does this need to be modified to take into account MPI?
        Real Likelihood = 0.5 * ((Phi*image) - y).squaredNorm() / (sigma * sigma);
        return Likelihood;
    }

    private:
    Real sigma;
    const LinearTransform &LT;
};

} // namespace sopt
#endif