#include <iostream>
#include <vector>
#include <catch.hpp>

#include <sopt/logging.h>
#include <sopt/types.h>
#include <sopt/utilities.h>
#include <sopt/cppflow_utils.h>
#include <cppflow/cppflow.h>
#include "cppflow/ops.h"
#include "cppflow/model.h"

// This header is not part of the installed sopt interface
// It is only present in tests
#include <tools_for_tests/directories.h>
#include <tools_for_tests/tiffwrappers.h>

// \min_{x} ||\Psi^Tx||_1 \quad \mbox{s.t.} \quad ||y - Ax||_2 < \epsilon and x \geq 0

typedef double Scalar;
typedef sopt::Vector<Scalar> Vector;
typedef sopt::Matrix<Scalar> Matrix;
typedef sopt::Image<Scalar> Image;

cppflow::tensor convert_image_to_tensor(Image const &image, int image_rows, int image_cols){
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

Eigen::Map<Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic>> convert_tensor_to_image(std::vector<float> model_output, int image_rows, int image_cols){
  // convert tensor of floats to Eigen::Array of doubles 

  std::vector<double> doubleResults(model_output.begin(), model_output.end());
  Eigen::Map<Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic>> output_image(doubleResults.data(), image_rows, image_cols);

  return output_image;
}

TEST_CASE("Cppflow"){

  // read in image
  std::string const input_image = "cameraman256";
  Image const image = sopt::notinstalled::read_standard_tiff(input_image);

  int const image_rows = image.rows();
  int const image_cols = image.cols();

  cppflow::tensor input_tensor = convert_image_to_tensor(image, image_rows, image_cols);

  // Read in model
  cppflow::model model(std::string(sopt::notinstalled::models_directory() + "/DnCNN/snr_15_model.pb/"));

  // Run model on image
  auto output_vector = model({{"serving_default_input0:0", input_tensor}}, {"StatefulPartitionedCall:0"});

  // Get values from output (has to be same type as the input to the model - float)
  auto output_tensor = output_vector[0].get_data<float>();

  auto output_image = convert_tensor_to_image(output_tensor, image_rows, image_cols);

  //sopt::utilities::write_tiff(output_image, "./cameraman_output.tiff");

  // compare input image to cleaned output image
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 ) 
  // check this is less than the number of pixels * 0.01

  auto mse = (image - output_image).square().sum() / image.size();
  CAPTURE(mse);
  CHECK(mse < 0.01);

}
