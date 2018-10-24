#include <numeric>
#include <random>
#include <Eigen/Eigenvalues>
#include "catch.hpp"

#include "sopt/power_method.h"

TEST_CASE("Power Method") {
  using namespace sopt;
  typedef t_real Scalar;
  auto const N = 10;
  Eigen::EigenSolver<Matrix<Scalar>> es;
  Matrix<Scalar> A(N, N);
  std::iota(A.data(), A.data() + A.size(), 0);
  es.compute(A.adjoint() * A, true);

  auto const eigenvalues = es.eigenvalues();
  auto const eigenvectors = es.eigenvectors();
  Eigen::DenseIndex index;
  (eigenvalues.transpose() * eigenvalues).real().maxCoeff(&index);
  auto const eigenvalue = eigenvalues(index);
  Vector<t_complex> const eigenvector = eigenvectors.col(index);
  // Create input vector close to solution
  Vector<t_complex> const input = eigenvector * 1e-4 + Vector<t_complex>::Random(N);
  auto const pm = algorithm::PowerMethod<t_complex>().tolerance(1e-12);

  SECTION("AtA") {
    auto const lt = linear_transform(A.cast<t_complex>());
    auto const result = pm.AtA(lt, input);
    CHECK(result.good);
    CAPTURE(eigenvalue);
    CAPTURE(result.magnitude);
    CAPTURE(result.eigenvector.transpose() * eigenvector);
    CHECK(std::abs(result.magnitude - std::abs(eigenvalue)) < 1e-8);
  }

  SECTION("A") {
    auto const result = pm((A.adjoint() * A).cast<t_complex>(), input);
    CHECK(result.good);
    CAPTURE(eigenvalue);
    CAPTURE(result.magnitude);
    CAPTURE(result.eigenvector.transpose() * eigenvector);
    CHECK(std::abs(result.magnitude - std::abs(eigenvalue)) < 1e-8);
  }
}

TEST_CASE("Power Method (from Purify)") {
  using namespace sopt;
  typedef t_real Scalar;
  auto const N = 10;
  const t_uint power_iters = 1000;
  const t_real power_tol = 1e-4;
  Eigen::EigenSolver<Matrix<Scalar>> es;
  Matrix<Scalar> A(N, N);
  std::iota(A.data(), A.data() + A.size(), 0);
  es.compute(A.adjoint() * A, true);

  auto const eigenvalues = es.eigenvalues();
  auto const eigenvectors = es.eigenvectors();
  Eigen::DenseIndex index;
  (eigenvalues.transpose() * eigenvalues).real().maxCoeff(&index);
  auto const eigenvalue = eigenvalues(index);
  Vector<t_complex> const eigenvector = eigenvectors.col(index);
  // Create input vector close to solution
  Vector<t_complex> const input = eigenvector * 1e-4 + Vector<t_complex>::Random(N);

  const auto forward = [=](Vector<t_complex> &out, const Vector<t_complex> &in) { out = A * in; };
  const auto backward = [=](Vector<t_complex> &out, const Vector<t_complex> &in) {
    out = A.adjoint() * in;
  };
  SECTION("Power Method") {
    auto op_norm = algorithm::power_method<Vector<t_complex>>({forward, backward}, power_iters,
                                                              power_tol, input);
    CAPTURE(eigenvalue);
    CAPTURE(op_norm * op_norm);
    CHECK(std::abs(op_norm * op_norm - eigenvalue) < power_tol * power_tol);
  }
}
