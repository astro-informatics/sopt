#include <algorithm>
#include <exception>
#include <functional>
#include <iostream>
#include <random>
#include <vector>
#include <ctime>
#include <catch.hpp>
#include <unsupported/Eigen/CXX11/Tensor>

#include <sopt/imaging_forward_backward.h>
#include <sopt/logging.h>
#include <sopt/maths.h>
#include <sopt/relative_variation.h>
#include <sopt/sampling.h>
#include <sopt/types.h>
#include <sopt/utilities.h>
#include <sopt/wavelets.h>
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

TEST_CASE("Cppflow"){
  // Read TIFF into sopt::Image (which is really Eigen::Array)
  // Image is size (256,256), type double

  std::cout << "============Reading greyscale input file" << std::endl;
  std::string const input_image = "cameraman256";
  Image const image = sopt::notinstalled::read_standard_tiff(input_image);
  
  std::cout << "============Convert to Eigen::Tensor" << std::endl;
  // Create Eigen::Tensor
  //Eigen::Tensor<double, 2> eigen_tensor(256, 256);

  cppflow::tensor cf_tensor;
  float target = 1.0;
  cf_tensor = cppflow::fill({1}, target);
  auto input = cppflow::cast(cf_tensor, TF_UINT8, TF_FLOAT);
  input = cppflow::expand_dims(input, 0);
  /*
  // Initialize all elements to image values.
  for (int i = 0; i < 256; ++i) {
    for (int j = 0; j < 256; ++j) {
      cf_tensor(i, j) = image(i,j);
    }
  }

  // Create cppflow:tensor from Eigen::Tensor
  std::cout << "============Convert to cppflow::tensor" << std::endl;
  //cppflow::tensor cf_tensor(double_t, (265,265));
  cppflow::tensor cf_tensor(eigen_tensor);
  */
  // Read in model
  std::cout << "============Reading model file" << std::endl;
  cppflow::model model(std::string("/home/sarah/Projects/LEXCI/sopt/cppflow/examples/lexci_model/model"));

  // Run model on image
  std::cout << "============Run model on tensor" << std::endl;
  auto output = model({{"serving_default_input0:0", input}}, {"StatefulPartitionedCall:0"});

  // Get values from output
  //auto values = output[0].get_data<float>();

  // Save output as sopt::Image
  Image const model_output = image;

  // compare input image to cleaned output image
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 ) 
  // check this is less than the number of pixels * 0.01

  auto mse = (image - model_output).square().sum() / image.size();
  CAPTURE(mse);
  CHECK(mse < 0.01);
}
