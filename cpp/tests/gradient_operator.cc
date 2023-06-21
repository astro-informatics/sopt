#include <catch.hpp>
#include <memory>
#include <random>

#include "sopt/config.h"
#include "sopt/gradient_operator.h"
#include "sopt/types.h"
#include "sopt/utilities.h"

// This header is not part of the installed sopt interface
// It is only present in tests
#include "tools_for_tests/directories.h"
#include "tools_for_tests/tiffwrappers.h"

TEST_CASE("Gradient Operator") {
  using namespace sopt;
  // Some typedefs for simplicity
  typedef double Scalar;

  typedef sopt::Vector<Scalar> Vector;

  typedef sopt::Matrix<Scalar> Matrix;

  typedef sopt::Image<Scalar> Image;

  Image const image = sopt::notinstalled::read_standard_tiff("cameraman256");
  auto const psi = sopt::gradient_operator::gradient_operator<Scalar>(image.rows(), image.cols());
  Matrix input = Matrix::Ones(image.rows(), image.cols());
  for (Eigen::Index i(0); i < image.rows(); i++) {
    input.row(i) *= static_cast<Scalar>(i);
  }
  Vector output = psi.adjoint() * Vector::Map(input.data(), input.size());
  CAPTURE(output.segment(0, 5));
  CAPTURE(output.segment(image.size(), 5));
  CHECK(output.size() == 2 * input.size());
  CHECK(output.segment(0, input.size()).isApprox(Vector::Zero(input.size())));
  CHECK(output.segment(input.size(), input.size() - 1)
            .isApprox(Vector::Constant(0.5, input.size() - 1)));
  input = Matrix::Ones(image.rows(), image.cols());
  for (Eigen::Index i(0); i < image.cols(); i++) {
    input.col(i) *= static_cast<Scalar>(i);
  }
  output = psi.adjoint() * Vector::Map(input.data(), input.size());
  CAPTURE(output.segment(0, 5));
  CAPTURE(output.segment(image.size(), 5));
  CHECK(output.size() == 2 * input.size());
  CHECK(output.segment(0, input.size() - 1).isApprox(Vector::Constant(0.5, input.size() - 1)));
  CHECK(output.segment(input.size(), input.size()).isApprox(Vector::Zero(input.size())));
}
