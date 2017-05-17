#include <numeric>
#include <Eigen/Eigenvalues>
#include <sopt/power_method.h>

int main(int, char const **) {

  typedef sopt::t_real Scalar;
  auto const N = 10;

  // Create some kind of matrix
  sopt::Matrix<Scalar> const A
      = sopt::Matrix<uint8_t>::Identity(N, N).cast<Scalar>() * 100 + sopt::Matrix<Scalar>(N, N);

  // the linear transform wraps the matrix into something the power-method understands
  auto const lt = sopt::linear_transform(A.cast<sopt::t_complex>());
  // instanciate the power method
  auto const pm = sopt::algorithm::PowerMethod<sopt::t_complex>().tolerance(1e-12);
  // call it
  auto const result = pm.AtA(lt, sopt::Vector<sopt::t_complex>::Ones(N));

  // Compute the eigen values explictly to figure out the result of the power method
  Eigen::EigenSolver<sopt::Matrix<Scalar>> es;
  es.compute(A.adjoint() * A, true);
  Eigen::DenseIndex index;
  (es.eigenvalues().transpose() * es.eigenvalues()).real().maxCoeff(&index);
  auto const eigenvalue = es.eigenvalues()(index);

  // This should pass if the power method is correct
  if(std::abs(result.magnitude - std::abs(eigenvalue)) > 1e-8 * std::abs(eigenvalue))
    throw std::runtime_error("Power method did not converge to the expected value");

  return 0;
}
