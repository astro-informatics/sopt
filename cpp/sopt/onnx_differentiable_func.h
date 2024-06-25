#ifndef ONNX_DIFFERENTIABLE_FUNC
#define ONNX_DIFFERENTIABLE_FUNC

#include "sopt/ort_session.h"
#include "sopt/differentiable_func.h"

namespace sopt
{


template<typename SCALAR>
class ONNXDifferentiableFunc : public DifferentiableFunc<SCALAR> 
{
    using t_Gradient = typename DifferentiableFunc<SCALAR>::t_Gradient;
    using Real = typename DifferentiableFunc<SCALAR>::Real;
    using Vector = typename DifferentiableFunc<SCALAR>::t_Vector;
    using LinearTransform = typename DifferentiableFunc<SCALAR>::t_LinearTransform;

    public:
    ONNXDifferentiableFunc(const std::string& function_model_path,
                           const std::string& gradient_model_path, 
                           const Real sigma, 
                           const Real mu, 
                           const Real lambda,
                           const LinearTransform& Phi): LT(Phi), sigma(sigma), mu(mu), lambda(lambda),
                                                        function_model(function_model_path),
                                                        gradient_model(gradient_model_path)
    {}

    void log_message() const override
    {
        SOPT_HIGH_LOG("Using ONNX model differentiable function f(x)");
    }

    void gradient(Vector &output, const Vector &image, const Vector &residual,
                  const LinearTransform &Phi) const override 
    {
      output = Phi.adjoint() * (residual / (sigma * sigma));  // L2 norm
      Vector scaled_image = image * mu;
      Vector ANN_gradient = gradient_model.compute(scaled_image);  // regulariser
      output += (ANN_gradient * lambda);
    }

    Real function(Vector const &image, Vector const &y, LinearTransform const &Phi) const override
    {
        // Does this need to be modified to take into account MPI?
        Real Likelihood = 0.5 * ((Phi*image) - y).squaredNorm() / (sigma * sigma);
        Vector scaled_image = image * mu;
        Real Prior = (lambda / mu) * (function_model.compute(scaled_image)[0]); // Is this correct?
        return Likelihood + Prior;
    }

    private:
    ORTsession function_model;
    ORTsession gradient_model;
    Real sigma;
    Real mu;
    Real lambda;
    const LinearTransform &LT;
};

} // namespace sopt
#endif