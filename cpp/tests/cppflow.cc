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

  std::string const input_image = "cameraman256";
  Image const image = sopt::notinstalled::read_standard_tiff(input_image);
  
  // create a vector
  std::cout << "============Create vector" << std::endl;
  std::vector<int64_t> tensor_shape = {256, 256};
  std::vector<float> values(256*256, 1);


  // Initialize all elements to image values.
  for (int i = 0; i < 256; ++i) {
    for (int j = 0; j < 256; ++j) {
      values[i*256+j] = image(i,j);
    }
  }
  
  // create a tensor from vector
  std::cout << "============Create tensor" << std::endl;
  cppflow::tensor cf_tensor(values, tensor_shape);
  
  auto input = cppflow::cast(cf_tensor, TF_UINT8, TF_FLOAT);
  // Add batch dimension at start
  input = cppflow::expand_dims(input, 0);
  // add extra spatial dimension at end??
  // cppflow::decode_jpeg results in a shape (256, 256, 1) so we assume this is needed
  input = cppflow::expand_dims(input, -1);

  // Read in model
  std::cout << "============Reading model file" << std::endl;
  cppflow::model model(std::string("/home/sarah/Projects/LEXCI/sopt/cppflow/examples/lexci_model/model"));

  // Run model on image
  std::cout << "============Run model on tensor" << std::endl;
  auto output = model({{"serving_default_input0:0", input}}, {"StatefulPartitionedCall:0"});

  // Get values from output
  auto results = output[0].get_data<float>();
  std::vector<double> doubleResults(results.begin(), results.end());

  
  Eigen::Map<Eigen::Array<double, 256, 256>> model_output(doubleResults.data());
  model_output.transposeInPlace();

  sopt::utilities::write_tiff(model_output, "./cameraman_output.tiff");

  // compare input image to cleaned output image
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 ) 
  // check this is less than the number of pixels * 0.01

  auto mse = (image - model_output).square().sum() / image.size();
  CAPTURE(mse);
  CHECK(mse < 0.01);

  

}
