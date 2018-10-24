#ifndef SOPT_MPI_UTILITIES_H
#define SOPT_MPI_UTILITIES_H

#include "sopt/config.h"
#ifdef SOPT_MPI
#include <Eigen/Core>
#include "sopt/maths.h"
#include "sopt/mpi/communicator.h"
#include "sopt/real_type.h"

namespace sopt {
namespace mpi {

//! Computes norm of distributed vector
template <class T>
typename real_type<typename T::Scalar>::type l2_norm(Eigen::MatrixBase<T> const &x,
                                                     Communicator const &comm) {
  return std::sqrt(comm.all_sum_all(x.squaredNorm()));
}

//! Weighted l2-norm over distributed data
template <class T0, class T1>
typename real_type<typename T0::Scalar>::type l2_norm(Eigen::ArrayBase<T0> const &input,
                                                      Eigen::ArrayBase<T1> const &weights,
                                                      Communicator const &comm) {
  if (weights.size() == 1) {
    auto const weight_2 = std::real(weights(0) * std::conj(weights(0)));
    return std::sqrt(comm.all_sum_all(input.matrix().squaredNorm() * weight_2));
  }
  return sopt::mpi::l2_norm((input * weights).matrix(), comm);
}
//! Weighted l2-norm over distributed data
template <class T0, class T1>
typename real_type<typename T0::Scalar>::type l2_norm(Eigen::MatrixBase<T0> const &input,
                                                      Eigen::MatrixBase<T1> const &weights,
                                                      Communicator const &comm) {
  return sopt::mpi::l2_norm(input.array(), weights.array(), comm);
}

//! Computes weighted L1 norm
template <class T0, class T1>
typename real_type<typename T0::Scalar>::type l1_norm(Eigen::ArrayBase<T0> const &input,
                                                      Eigen::ArrayBase<T1> const &weights,
                                                      Communicator const &comm) {
  return comm.all_sum_all(sopt::l1_norm(input, weights));
}
//! Computes weighted L1 norm
template <class T0, class T1>
typename real_type<typename T0::Scalar>::type l1_norm(Eigen::MatrixBase<T0> const &input,
                                                      Eigen::MatrixBase<T1> const &weights,
                                                      Communicator const &comm) {
  return comm.all_sum_all(sopt::l1_norm(input, weights));
}
//! Computes L1 norm
template <class T0>
typename real_type<typename T0::Scalar>::type l1_norm(Eigen::ArrayBase<T0> const &input,
                                                      Communicator const &comm) {
  return comm.all_sum_all(sopt::l1_norm(input));
}
//! Computes L1 norm
template <class T0>
typename real_type<typename T0::Scalar>::type l1_norm(Eigen::MatrixBase<T0> const &input,
                                                      Communicator const &comm) {
  return comm.all_sum_all(sopt::l1_norm(input));
}
}  // namespace mpi
}  // namespace sopt
#endif
#endif
