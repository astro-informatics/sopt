#include <catch2/catch_all.hpp>
#include <Eigen/Core>
#include "sopt/ort_session.h"
#include "sopt/utilities.h"
#include "tools_for_tests/directories.h"

using namespace sopt;

TEST_CASE("Load an example ORT model", "[ONNXrt]") {

  const std::string path(sopt::tools::models_directory());
  ORTsession model(path+"/example_grad_CRR_sigma_5_t_5.onnx");

  CHECK(true);
}

TEST_CASE("Check metadata of an example ORT model", "[ONNXrt]") {

  const std::string path(sopt::tools::models_directory());
  ORTsession model(path+"/example_grad_CRR_sigma_5_t_5.onnx");

  const double L = model.retrieve<double>("L_CRR");
  const double L_ref = 0.769605;

  CHECK(abs(L_ref - L) < 1e-6*L_ref);
}

TEST_CASE("Check forward folding of an example ORT model using std::vectors", "[ONNXrt]") {

  const std::string path(sopt::tools::models_directory());
  ORTsession model(path+"/example_grad_CRR_sigma_5_t_5.onnx");

  const size_t nROWS = 256, nCOLS = 256;
  const size_t input_size = 1 * nROWS * nCOLS;
  // This network metadata contains an example
  // input vector and reference output vector
  std::vector<float> input_values, expected_values;
  input_values.reserve(input_size);
  expected_values.reserve(input_size);
  input_values = utilities::split<float>(model.retrieve<std::string>("x_init"), ",");
  expected_values = utilities::split<float>(model.retrieve<std::string>("x_exp"), ",");

  // forward fold
  std::vector<float> output_values = model.compute(input_values);

  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 )
  // check this is less than the number of pixels * 0.01
  double mse = 0.0;
  for (size_t i = 0; i < output_values.size(); ++i) {
    double diff = output_values[i] - expected_values[i];
    mse += diff*diff;
  }
  mse /= output_values.size();

  CAPTURE(mse);
  CHECK(mse < 0.01);
}

TEST_CASE("Check forward folding of an example ORT model using sopt::Vectors", "[ONNXrt]") {

  const std::string path(sopt::tools::models_directory());
  ORTsession model(path+"/example_grad_CRR_sigma_5_t_5.onnx");

  const size_t nROWS = 256, nCOLS = 256;
  const size_t input_size = 1 * nROWS * nCOLS;
  // This network metadata contains an example
  // input vector and reference output vector
  std::vector<float> input_values, expected_values;
  input_values.reserve(input_size);
  expected_values.reserve(input_size);
  input_values = utilities::split<float>(model.retrieve<std::string>("x_init"), ",");
  expected_values = utilities::split<float>(model.retrieve<std::string>("x_exp"), ",");

  // convert flat vectors to sopt::Vector
  Vector<double> inputT(input_values.size());
  Vector<double> refT(expected_values.size());
  for (size_t i = 0; i < input_values.size(); ++i) {
    inputT[i] = input_values[i];
    refT[i] = expected_values[i];
  }

  // forward fold using sopt::Vector
  Vector<double> outputT = model.compute(inputT);

  // compare output tensor to reference tensor
  // calculate mean squared error sum_i ( ( x_true(i) - x_est(i) ) **2 )
  // check this is less than the number of pixels * 0.01
  auto mse = (outputT - refT).squaredNorm() / outputT.size();
  CAPTURE(mse);
  CHECK(mse < 0.01);
}
