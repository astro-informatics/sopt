#include <catch2/catch_all.hpp>
#include <Eigen/Core>
#include "sopt/ort_session.h"
#include "sopt/utilities.h"
#include "tools_for_tests/directories.h"

using namespace sopt;

using TENSOR2D = typename Eigen::Map<Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic>>;

TEST_CASE("Load an example ORT model", "[ONNXrt]") {

  const std::string path(sopt::notinstalled::models_directory());
  ORTsession model(path+"/example_CRR_sigma_5_t_5.onnx");

  CHECK(true);
}

TEST_CASE("Check metadata of an example ORT model", "[ONNXrt]") {

  const std::string path(sopt::notinstalled::models_directory());
  ORTsession model(path+"/example_CRR_sigma_5_t_5.onnx");

  const double L = model.retrieve<double>("L_CRR");
  const double L_ref = 0.769605;

  CHECK(abs(L_ref - L) < 1e-6*L_ref);
}

TEST_CASE("Check forward folding of an example ORT model", "[ONNXrt]") {

  const std::string path(sopt::notinstalled::models_directory());
  ORTsession model(path+"/example_CRR_sigma_5_t_5.onnx");

  const size_t nROWS = 256, nCOLS = 256;
  const size_t input_size = 1 * nROWS * nCOLS;
  // This network metadata contains an example
  // input vector and reference output vector
  std::vector<double> input_values, expected_values;
  input_values.reserve(input_size);
  expected_values.reserve(input_size);
  input_values = utilities::split<double>(model.retrieve<std::string>("x_init"), ",");
  expected_values = utilities::split<double>(model.retrieve<std::string>("x_exp"), ",");

  // convert flat vectors to image tensors
  TENSOR2D refT(expected_values.data(), nROWS, nCOLS);
  TENSOR2D inputT(input_values.data(),  nROWS, nCOLS);

  // forward fold
  TENSOR2D outputT = model.compute(inputT);

  // compare output tensor to reference tensor
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 )
  // check this is less than the number of pixels * 0.01
  auto mse = (outputT - refT).square().sum() / outputT.size();
  CAPTURE(mse);
  CHECK(mse < 0.01);
}
