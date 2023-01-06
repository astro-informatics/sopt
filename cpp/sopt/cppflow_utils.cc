#include <Eigen/Core>
#include <vector>
#include "sopt/types.h"
#include <cppflow/cppflow.h>
#include "cppflow/ops.h"
#include "cppflow/model.h"

namespace sopt {
namespace cppflowutils {
    cppflow::tensor convert_image_to_tensor(Image<double> const &image, int image_rows, int image_cols){
        // Convert the Sopt::Image of doubles(wrapper for Eigen::Array) to a cppflow::tensor of floats

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

  // Convert an image stored in a sopt::Vector to a cppflow::tensor of floats
  cppflow::tensor convert_image_to_tensor(sopt::Vector<double> const &image, int image_rows, int image_cols) {

    std::vector<float> values(&image[0], image.data()+image.size());
    cppflow::tensor input_tensor(values, {1, image_rows, image_cols, 1});

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
