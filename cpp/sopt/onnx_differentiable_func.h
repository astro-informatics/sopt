#ifndef ONNX_DIFFERENTIABLE_FUNC
#define ONNX_DIFFERENTIABLE_FUNC

#include "sopt/ort_session.h"
#include "sopt/differentiable_func.h"
#include <vector>
#include <array>
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
                           const LinearTransform& Phi,
                           const std::vector<int64_t> dimensions = {}): LT(Phi), sigma(sigma), mu(mu), lambda(lambda),
                                                              function_model(function_model_path),
                                                              gradient_model(gradient_model_path)
    {
        if(dimensions.empty()) infer_square_dimensions = true;
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
      std::vector<float> float_image = imageToFloat(scaled_image);      
      Vector ANN_gradient = floatToImage<SCALAR>(gradient_model.compute(float_image, dimensions));  // regulariser
      output += (ANN_gradient * lambda);
    }

    void infer_dimensions(const size_t image_size)
    {
        set_dimensions({static_cast<int64_t>(sqrt(image_size)), static_cast<int64_t>(sqrt(image_size))./});
        if(dimensions[0] * dimensions[1] != image_size)
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
        // Does this need to be modified to take into account MPI?
        Real Likelihood = 0.5 * ((Phi*image) - y).squaredNorm() / (sigma * sigma);
        Vector scaled_image = image * mu;
        std::vector<float> float_image = imageToFloat(scaled_image);
        Real Prior = (lambda / mu) * (function_model.compute(float_image, dimensions)[0]); // Is this correct?
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