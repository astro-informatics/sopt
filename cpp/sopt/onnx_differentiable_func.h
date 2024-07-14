#ifndef ONNX_DIFFERENTIABLE_FUNC
#define ONNX_DIFFERENTIABLE_FUNC

#include "sopt/ort_session.h"
#include "sopt/differentiable_func.h"
#include <vector>
namespace sopt
{

    std::vector<float> imageToFloat(sopt::Vector<t_complex> const &image)
    {
        std::vector<float> float_image(image.size());
        for (int i = 0; i < image.size(); i++)
        {
            float_image[i] = image[i].real();
        }
        return float_image;
    }

    template<typename T>
    std::vector<float> imageToFloat(sopt::Vector<T> const &image)
    {
        std::vector<float> float_image(image.size());
        for (int i = 0; i < image.size(); i++)
        {
            float_image[i] = static_cast<float>(image[i]);
        }
        return float_image;
    }

    sopt::Vector<t_complex> floatToImage(std::vector<float> const &float_image)
    {
        sopt::Vector<t_complex> image(float_image.size());
        for (int i = 0; i < float_image.size(); i++)
        {
            image[i] = t_complex(float_image[i], 0);
        }
        return image;
    }

    template<typename T>
    sopt::Vector<T> floatToImage(std::vector<float> const &float_image)
    {
        sopt::Vector<T> image(float_image.size());
        for (int i = 0; i < float_image.size(); i++)
        {
            image[i] = static_cast<T>(float_image[i]);
        }
        return image;
    }

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
      std::vector<float> float_image = imageToFloat(scaled_image);
      Vector ANN_gradient = floatToImage(gradient_model.compute(float_image));  // regulariser
      output += (ANN_gradient * lambda);
    }

    Real function(Vector const &image, Vector const &y, LinearTransform const &Phi) const override
    {
        // Does this need to be modified to take into account MPI?
        Real Likelihood = 0.5 * ((Phi*image) - y).squaredNorm() / (sigma * sigma);
        Vector scaled_image = image * mu;
        std::vector<float> float_image = imageToFloat(scaled_image);
        Real Prior = (lambda / mu) * (function_model.compute(float_image)[0]); // Is this correct?
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