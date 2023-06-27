#include <numeric>
#include <random>
#include <Eigen/Eigenvalues>
#include "catch.hpp"

#include "sopt/power_method.h"

TEST_CASE("Power Method") {
  using namespace sopt;
  using Scalar = t_real;
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
  using Scalar = t_real;
  auto const N = 10;
  const t_uint power_iters = 100000;
  const t_real power_tol = 1e-6;
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
    const sopt::LinearTransform<Vector<t_complex>> op = {forward, backward};
    auto const result =
        algorithm::power_method<Vector<t_complex>>(op, power_iters, power_tol, input);
    const t_real op_norm = std::get<0>(result);
    const Vector<t_complex> op_eigen_vector_c = std::get<1>(result);
    CHECK(op_eigen_vector_c.unaryExpr([](t_complex x) { return std::arg(x); })
              .isApprox(Vector<t_complex>::Constant(op_eigen_vector_c.size(),
                                                    std::arg(op_eigen_vector_c(0))),
                        power_tol));
    const Vector<t_complex> op_eigen_vector =
        op_eigen_vector_c * std::polar<t_real>(1, -std::arg(op_eigen_vector_c(0)));
    CAPTURE(eigenvalue);
    CAPTURE(op_norm * op_norm);
    CAPTURE(op_eigen_vector);
    CAPTURE(eigenvector);
    CHECK(op_norm == Approx(std::sqrt(std::abs(eigenvalue))).epsilon(power_tol));
    CHECK(op_eigen_vector.isApprox(eigenvector, power_tol));
    auto const norm_operator_result =
        algorithm::normalise_operator<Vector<t_complex>>(op, power_iters, power_tol, input);
    CHECK(std::get<0>(norm_operator_result) == Approx(op_norm).epsilon(1e-12));
    CHECK(std::get<1>(norm_operator_result).isApprox(op_eigen_vector_c, 1e-12));
    CHECK(((op * input) / op_norm)
              .eval()
              .isApprox((std::get<2>(norm_operator_result) * input).eval(), 1e-12));
    CHECK(((op.adjoint() * input) / op_norm)
              .eval()
              .isApprox((std::get<2>(norm_operator_result).adjoint() * input).eval(), 1e-12));
  }
}
