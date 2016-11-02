#ifndef SOPT_MPI_UTILITIES_H
#define SOPT_MPI_UTILITIES_H

#include "sopt/config.h"
#ifdef SOPT_MPI
#include <Eigen/Core>
#include "sopt/mpi/communicator.h"
#include "sopt/real_type.h"

namespace sopt {
namespace mpi {

//! Computes norm of distributed vector
template <class T>
typename real_type<typename T::Scalar>::type
l2_norm(Eigen::MatrixBase<T> const &x, Communicator const &comm) {
  return std::sqrt(comm.all_sum_all(x.squaredNorm()));
}
}
} /* sopt::mpi */
#endif
#endif
