#include <iostream>
#include <vector>
#include <catch2/catch_all.hpp>

#include "sopt/logging.h"
#include "sopt/types.h"
#include "sopt/utilities.h"
#include "sopt/ort_session.h"

// This header is not part of the installed sopt interface
// It is only present in tests
#include "tools_for_tests/directories.h"
#include "tools_for_tests/tiffwrappers.h"


using Scalar = double;
using Image = sopt::Image<Scalar>;
using Vector = sopt::Vector<Scalar>;


TEST_CASE("Cppflow Model"){

  // read in image
  const std::string input_image = "cameraman256";
  const Image image = sopt::tools::read_standard_tiff(input_image);

  const int image_rows = image.rows();
  const int image_cols = image.cols();

  // Read in model
  const std::string path(sopt::tools::models_directory() + "/snr_15_model_dynamic.onnx");
  sopt::ORTsession model(path);

  // Run model on image
  const Image output_image = model.compute(image, {1,image_rows,image_cols,1});

  // compare input image to cleaned output image
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 )
  // check this is less than the number of pixels * 0.01

  auto mse = (image - output_image).square().sum() / image.size();
  CAPTURE(mse);
  CHECK(mse < 0.01);

}
