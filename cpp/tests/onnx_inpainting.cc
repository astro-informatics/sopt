#include <algorithm>
#include <exception>
#include <functional>
#include <iostream>
#include <random>
#include <vector>
#include <ctime>
#include <catch2/catch_all.hpp>

#include "sopt/imaging_forward_backward.h"
#include "sopt/real_indicator.h"
#include "sopt/logging.h"
#include "sopt/maths.h"
#include "sopt/relative_variation.h"
#include "sopt/sampling.h"
#include "sopt/types.h"
#include "sopt/utilities.h"
#include "sopt/ort_session.h"
#include "sopt/relative_variation.h"
#include "sopt/onnx_differentiable_func.h"

// This header is not part of the installed sopt interface
// It is only present in tests
#include "tools_for_tests/directories.h"
#include "tools_for_tests/tiffwrappers.h"

// \min_{x} ||\Psi^Tx||_1 \quad \mbox{s.t.} \quad ||y - Ax||_2 < \epsilon and x \geq 0

using Scalar = double;
using Vector = sopt::Vector<Scalar>;
using Matrix = sopt::Matrix<Scalar>;
using Image = sopt::Image<Scalar>;
using LinearTransform = sopt::LinearTransform<Vector>;

TEST_CASE("Inpainting"){

  // black magic?
  double lambda = 5e4;
  double mu = 20;

  extern std::unique_ptr<std::mt19937_64> mersenne;
  std::string const input = "cameraman256";


  Image const image = sopt::tools::read_standard_tiff(input);

  sopt::t_uint nmeasure = std::floor(0.5 * image.size());
  LinearTransform const sampling =
      sopt::linear_transform<Scalar>(sopt::Sampling(image.size(), nmeasure, *mersenne));

  Vector const y0 = sampling * Vector::Map(image.data(), image.size());
  auto constexpr snr = 30.0;
  auto const sigma = y0.stableNorm() / std::sqrt(y0.size()) * std::pow(10.0, -(snr / 20.0));
  auto const epsilon = std::sqrt(nmeasure + 2 * std::sqrt(y0.size())) * sigma;

  // set the model function and gradient
  std::string const prior_path = std::string(sopt::tools::models_directory() + "/example_cost_CRR_sigma_5_t_5.onnx");
  std::string const prior_gradient_path = std::string(sopt::tools::models_directory() + "/example_grad_CRR_sigma_5_t_5.onnx");
  //sopt::ORTsession onnx_model(model_path);
  std::shared_ptr<sopt::ONNXDifferentiableFunc<Scalar>> diff_function = std::make_shared<sopt::ONNXDifferentiableFunc<Scalar>>(prior_path, prior_gradient_path, sigma, mu, lambda, sampling);

  std::normal_distribution<> gaussian_dist(0, sigma);
  Vector y(y0.size());
  for (sopt::t_int i = 0; i < y0.size(); i++) y(i) = y0(i) + gaussian_dist(*mersenne);

  Eigen::VectorXd dirty_image = sampling.adjoint() * y;
  Eigen::VectorXd init_res = ((sampling * dirty_image) - y);
  auto init_res_norm = init_res.array().abs().sum();
  SOPT_HIGH_LOG("Initial residual norm: {}", init_res_norm);

  sopt::t_real constexpr gamma = 18;
  sopt::t_real const beta = sigma * sigma * 0.5;
  //auto const f_gradient = [&onnx_model, sigma, lambda, mu](Vector &output, const Vector &image,
  //                                                        const Vector &residual, const LinearTransform &Phi) -> void {
  //  output = Phi.adjoint() * (residual / (sigma * sigma));  // L2 norm
  //  Vector scaled_image = image*mu;
  //  Vector ANN_gradient = onnx_model.compute(scaled_image);           // regulariser
  //  output += (ANN_gradient * lambda);
  //};

  // Arbitrary (absolute) tolerance level to produce a reasonable image which converges
  sopt::RelativeVariation<Scalar> scalvar(0.4,
                                          "Convergence function");
  std::function<bool(const Vector &, const Vector &)> convergence = [&scalvar](const Vector &x, const Vector &residual)
  {
    return scalvar(x.array());
  };

  auto fb = sopt::algorithm::ImagingForwardBackward<Scalar>(y);
  fb.itermax(500)
    .beta(beta)    // stepsize
    .sigma(sigma)  // sigma
    .gamma(gamma)  // regularisation paramater
    .relative_variation(1e-3)
    .residual_tolerance(0)
    .tight_frame(true)
    .Phi(sampling)
    .is_converged(convergence);
  
  //fb.set_f_gradient(f_gradient);
  fb.f_function(diff_function);

  // Create a shared pointer to the real indicator (non differentiable) function
  auto non_diff_func = std::make_shared<RealIndicator<Scalar>>();

  // Inject it into the ImagingForwardBackward object
  fb.g_function(non_diff_func);

  auto const diagnostic = fb();

  CHECK(diagnostic.good);
  CHECK(diagnostic.niters < 500);

  // compare input image to cleaned output image
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 )
  // check this is less than the number of pixels * 0.01

  Eigen::Map<const Eigen::VectorXd> flat_image(image.data(), image.size());
  auto mse = (flat_image - diagnostic.x).array().square().sum() / image.size();
  CAPTURE(mse);
  SOPT_HIGH_LOG("MSE: {}", mse);
  CHECK(mse < 0.01);
}
