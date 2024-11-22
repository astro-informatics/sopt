#ifndef ONNX_DIFFERENTIABLE_FUNC
#define ONNX_DIFFERENTIABLE_FUNC

#include "sopt/ort_session.h"
#include "sopt/differentiable_func.h"
#include <vector>
#include <array>
#include <exception>
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
                           const LinearTransform& Phi,
                           const std::vector<int64_t> dimensions = {}): LT(Phi), sigma(sigma), mu(mu), lambda(lambda),
                                                              function_model(function_model_path),
                                                              gradient_model(gradient_model_path)
    {
        Real L_CRR;  // Lipschitz constant
        if(dimensions.empty()) infer_square_dimensions = true;
        try
        {
            L_CRR = gradient_model.retrieve<double>("L_CRR");
            this->step_size = 0.98 / (1/(sigma*sigma) + mu * lambda * L_CRR);
            SOPT_MEDIUM_LOG("Lipschitz Constant for CRR = {}", L_CRR);
            SOPT_MEDIUM_LOG("Step size for CRR = {}", this->step_size);
        }
        catch(const std::exception &e)
        {
          SOPT_HIGH_LOG(
              "Failed to find a Lipschitz constant for the current model. Please ensure that the "
              "Lipschitz constant is included in the gradient model meta-data with the key "
              "\"L_CRR\". Setting step size to 1 by default.");
          SOPT_HIGH_LOG("Exception message retrieving L_CRR: {}", e.what());
          this->step_size = 1;
        }
    }

    void log_message() const override
    {
        SOPT_HIGH_LOG("Using ONNX model differentiable function f(x)");
    }

    void gradient(Vector &output, const Vector &image, const Vector &residual,
                  const LinearTransform &Phi) override 
    {
      if(infer_square_dimensions) infer_dimensions(image.size());

      output = Phi.adjoint() * (residual / (sigma * sigma));  // L2 norm
      Vector scaled_image = image * mu;
      std::vector<float> float_image = utilities::imageToFloat(scaled_image);      
      Vector ANN_gradient = utilities::floatToImage<SCALAR>(gradient_model.compute(float_image, dimensions));  // regulariser
      output += (ANN_gradient * lambda);
    }

    void infer_dimensions(const size_t image_size)
    {
        set_dimensions({1, static_cast<int64_t>(sqrt(image_size)), static_cast<int64_t>(sqrt(image_size))});
        if(dimensions[1] * dimensions[2] != image_size)
        {
          throw std::runtime_error("Image dimensions are not provided and image size is not compatible with a square image.");
        }
        infer_square_dimensions = false;
    }

    void set_dimensions(const std::vector<int64_t> &dims)
    {
        dimensions = dims;
    }

    Real function(Vector const &image, Vector const &y, LinearTransform const &Phi) override
    {
        if(infer_square_dimensions) infer_dimensions(image.size());
        Real Likelihood = 0.5 * ((Phi*image) - y).squaredNorm() / (sigma * sigma);
        Vector scaled_image = image * mu;
        std::vector<float> float_image = utilities::imageToFloat(scaled_image);
        Real Prior = (lambda / mu) * (function_model.compute(float_image, dimensions)[0]);
        return Likelihood + Prior;
    }

    private:
    ORTsession function_model;
    ORTsession gradient_model;
    Real sigma;
    Real mu;
    Real lambda;
    std::vector<int64_t> dimensions;
    const LinearTransform &LT;
    bool infer_square_dimensions = false;
};

} // namespace sopt
#endif