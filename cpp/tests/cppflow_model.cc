#include <iostream>
#include <vector>
#include <catch2/catch_all.hpp>

#include "sopt/logging.h"
#include "sopt/types.h"
#include "sopt/utilities.h"
#include "sopt/cppflow_utils.h"
#include <cppflow/cppflow.h>
#include <cppflow/ops.h>
#include <cppflow/model.h>

// This header is not part of the installed sopt interface
// It is only present in tests
#include "tools_for_tests/directories.h"
#include "tools_for_tests/tiffwrappers.h"


using Scalar = double;
using Image = sopt::Image<Scalar>;


TEST_CASE("Cppflow Model"){

  // read in image
  std::string const input_image = "cameraman256";
  Image const image = sopt::tools::read_standard_tiff(input_image);

  int const image_rows = image.rows();
  int const image_cols = image.cols();

  cppflow::tensor input_tensor = sopt::cppflowutils::convert_image_to_tensor(image, image_rows, image_cols);

  // Read in model
  cppflow::model model(std::string(sopt::tools::models_directory() + "/snr_15_model.pb/"));

  // Run model on image
  // TODO: Automatically detect the string parameters, see issue #320
  auto output_vector = model({{"serving_default_input0:0", input_tensor}}, {"StatefulPartitionedCall:0"});

  // Get values from output (has to be same type as the input to the model - float)
  auto output_tensor = output_vector[0].get_data<float>();

  auto output_image = sopt::cppflowutils::convert_tensor_to_image(output_tensor, image_rows, image_cols);

  // compare input image to cleaned output image
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 )
  // check this is less than the number of pixels * 0.01

  auto mse = (image - output_image).square().sum() / image.size();
  CAPTURE(mse);
  CHECK(mse < 0.01);

}
