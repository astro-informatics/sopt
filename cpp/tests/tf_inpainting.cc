#include <algorithm>
#include <exception>
#include <functional>
#include <iostream>
#include <random>
#include <vector>
#include <ctime>
#include <catch.hpp>

#include <sopt/imaging_forward_backward.h>
#include <sopt/tf_g_proximal.h>
#include <sopt/logging.h>
#include <sopt/maths.h>
#include <sopt/relative_variation.h>
#include <sopt/types.h>
#include <sopt/utilities.h>

// This header is not part of the installed sopt interface
// It is only present in tests
#include <tools_for_tests/directories.h>
#include <tools_for_tests/tiffwrappers.h>

// \min_{x} ||\Psi^Tx||_1 \quad \mbox{s.t.} \quad ||y - Ax||_2 < \epsilon and x \geq 0

typedef double Scalar;
typedef sopt::Vector<Scalar> Vector;
typedef sopt::Matrix<Scalar> Matrix;
typedef sopt::Image<Scalar> Image;

TEST_CASE("Inpainting"){
  extern std::unique_ptr<std::mt19937_64> mersenne;
  std::string const input = "cameraman256";
  std::string const model_path = std::string(sopt::notinstalled::models_directory() + "/DnCNN/snr_15_model.pb/");

  Image const image = sopt::notinstalled::read_standard_tiff(input);

  Vector const y0 = Vector::Map(image.data(), image.size());
  auto const snr = 15.0;
  auto const sigma = y0.stableNorm() / std::sqrt(y0.size()) * std::pow(10.0, -(snr / 20.0));

  std::normal_distribution<> gaussian_dist(0, sigma);
  Vector y(y0.size());
  for (sopt::t_int i = 0; i < y0.size(); i++) y(i) = y0(i) + gaussian_dist(*mersenne);

  sopt::t_real const gamma = 18;
  sopt::t_real const beta = sigma * sigma * 0.5;
  int const itermax = 500;

  auto fb = sopt::algorithm::ImagingForwardBackward<Scalar>(y);
  fb.itermax(itermax)
    .beta(beta)    // stepsize
    .sigma(sigma)  // sigma
    .gamma(gamma)  // regularisation paramater
    .relative_variation(1e-3)
    .residual_tolerance(0)
    .tight_frame(true);

  // Create a shared pointer to an instance of the TFGProximal class
  auto gp = std::make_shared<sopt::algorithm::TFGProximal<Scalar>>(model_path);

  // Inject it into the ImagingForwardBackward object
  fb.g_proximal(gp);

  auto const diagnostic = fb();

  sopt::utilities::write_tiff(image, "input_image.tiff");
  sopt::utilities::write_tiff(Image::Map(y0.data(), 256, 256), "sampled_image.tiff");
  sopt::utilities::write_tiff(Image::Map(y.data(), 256, 256), "noisy_image.tiff");
  sopt::utilities::write_tiff(Image::Map(diagnostic.x.data(), 256, 256), "output_image.tiff");

  const static Eigen::IOFormat CSVFormat(Eigen::FullPrecision, Eigen::DontAlignCols, ", ", "\n");
  std::ofstream input_file("input_image.txt");
  if (input_file.is_open())
    {
        input_file << y.format(CSVFormat);
        input_file.close();
    }

  std::ofstream output_file("output_image.txt");
  if (output_file.is_open())
    {
        output_file << diagnostic.x.format(CSVFormat);
        output_file.close();
    }



  CHECK(diagnostic.good);
  CHECK(diagnostic.niters < itermax);

  // compare input image to cleaned output image
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 )
  // check this is less than the number of pixels * 0.01

  auto mse = (image - diagnostic.x.array()).square().sum() / image.size();
  CAPTURE(image.size());
  CAPTURE(y0.size());
  CAPTURE(y.size());
  CAPTURE(diagnostic.x.size());
  CAPTURE(image.sum());
  CAPTURE(y.sum());
  CAPTURE(diagnostic.x.sum());
  CAPTURE(mse);
  CHECK(mse < 0.01);
}
