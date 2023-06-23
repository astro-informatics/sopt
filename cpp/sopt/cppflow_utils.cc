#include <Eigen/Core>
#include <vector>
#include "sopt/types.h"
#include <cppflow/cppflow.h>
#include "cppflow/ops.h"
#include "cppflow/model.h"
#include <stdexcept>
#include <sstream>
#include <algorithm>

namespace sopt {
namespace cppflowutils {

  // arbitrary constant for imaginary part of image vectors. 
  const double imaginary_threshold = 1e-4;

    cppflow::tensor convert_image_to_tensor(Image<double> const &image, int image_rows, int image_cols){
        // Convert the Sopt::Image of doubles(wrapper for Eigen::Array) to a cppflow::tensor of floats
        // TODO: Make types template parameters
        // create a vector of the right shape (model expects extra dimensions on start and end)
        std::vector<int64_t> input_shape = {1, image_rows, image_cols, 1};

        std::vector<float> input_values(image_rows*image_cols, 1);
        for (int i = 0; i < image.rows(); ++i) {
            for (int j = 0; j < image.cols(); ++j) {
              input_values[j*image_cols+i] = image(i,j);
            }
        }

        // create a tensor from vector
        cppflow::tensor input_tensor(input_values, input_shape);

        return input_tensor;
    }

  cppflow::tensor convert_image_to_tensor(Image<std::complex<double>> const &image, int image_rows, int image_cols) {
    // Convert the Sopt::Image of complex (wrapper for Eigen::Array) to a cppflow::tensor of floats
    // Only takes the real part for processing, on the assumption that the imaginary part is negligible.
    // If ratio of imaginary part to real part is greater than the threshold then this will throw an exception.
    // TODO: Make types template parameters
    // create a vector of the right shape (model expects extra dimensions on start and end)
    std::vector<int64_t> input_shape = {1, image_rows, image_cols, 1};

    std::vector<float> input_values(image_rows*image_cols, 1);

    for (int i = 0; i < image.rows(); ++i) {
        for (int j = 0; j < image.cols(); ++j) {
          if(std::abs(image(i,j).imag()) > cppflowutils::imaginary_threshold)
          {
            throw std::runtime_error("Cannot convert to tensorflow format: imaginary component of image is non-negligible.");
          }
          input_values[j*image_cols+i] = image(i,j).real();
        }
    }

    // create a tensor from vector
    cppflow::tensor input_tensor(input_values, input_shape);
    return input_tensor;
  }

  // Convert an image stored in a sopt::Vector<double> to a cppflow::tensor of floats
  cppflow::tensor convert_image_to_tensor(sopt::Vector<double> const &image, int image_rows, int image_cols) {

    std::vector<float> input_values(&image[0], image.data()+image.size());
    cppflow::tensor input_tensor(input_values, {1, image_rows, image_cols, 1});

    return input_tensor;

  }

  // Convert an image stored in a sopt::Vector<double> to a cppflow::tensor of floats
  cppflow::tensor convert_image_to_tensor(sopt::Vector<std::complex<double>> const &image, int image_rows, int image_cols) {

    std::cout << "Convering image to real for tensorflow." << std::endl;
    std::vector<float> input_values(image.size());
    std::vector<float> imaginaries(image.size());
    std::vector<float> reals(image.size());
    std::stringstream s;
    bool error = false;
    s << "Cannot convert to tensorflow format: imaginary component of image vector is non negligible: ";
    for(size_t i = 0; i < image.size(); i++)
    {
      if(std::abs(image(i).imag()) > cppflowutils::imaginary_threshold)
      {
        s << image(i);
        error = true;
        //throw std::runtime_error(s.str());
      }
      input_values[i] = image(i).real();
      imaginaries[i] = std::abs(image(i).imag());
      reals[i] = std::abs(image(i).real());
    }
    std::cout << "Max real = " << *std::max_element(reals.begin(), reals.end()) << std::endl;
    std::cout << "Max imag = " << *std::max_element(imaginaries.begin(), imaginaries.end()) << std::endl;
    if(error)
    {
      //throw std::runtime_error(s.str());
    }
    cppflow::tensor input_tensor(input_values, {1, image_rows, image_cols, 1});

    return input_tensor;
  }

  // Convert model output in a std::vector into a sopt::Image (2D Eigen::Array)
  Eigen::Map<Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic>> convert_tensor_to_image(std::vector<float> model_output, int image_rows, int image_cols){
    // convert tensor of floats to Eigen::Array of doubles

    std::vector<double> doubleResults(model_output.begin(), model_output.end());
    Eigen::Map<Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic>> output_image(doubleResults.data(), image_rows, image_cols);

    return output_image;
  }

}  // namespace cppflowutils
}  // namespace sopt
