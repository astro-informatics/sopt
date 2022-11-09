#include <algorithm>
#include <exception>
#include <functional>
#include <iostream>
#include <random>
#include <vector>
#include <ctime>
#include <catch.hpp>

#include <sopt/imaging_forward_backward.h>
#include <sopt/logging.h>
#include <sopt/maths.h>
#include <sopt/relative_variation.h>
#include <sopt/sampling.h>
#include <sopt/types.h>
#include <sopt/utilities.h>
#include <sopt/wavelets.h>

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
  extern std::unique_ptr<std::mt19937_64> mersenne;
  std::string const input = "cameraman256";

  Image const image = sopt::notinstalled::read_standard_tiff(input);

  // Just doing this so I can check it is actually doing something with the image
  sopt::t_uint nmeasure = std::floor(0.5 * image.size());

  CAPTURE(nmeasure);
  CHECK(nmeasure < 1000000);


  /*Image const model_output = image;

  // compare input image to cleaned output image
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 ) 
  // check this is less than the number of pixels * 0.01

  auto mse = (image - model_output).square().sum() / image.size();
  CAPTURE(mse);
  CHECK(mse < 0.01);*/
}
