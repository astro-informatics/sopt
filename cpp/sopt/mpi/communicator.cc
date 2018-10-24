#include "sopt/mpi/communicator.h"
#include <exception>
#include <mpi.h>
#include "sopt/mpi/session.h"

namespace sopt {
namespace mpi {

void Communicator::delete_comm(Communicator::Impl *const impl) {
  if (impl->comm != MPI_COMM_WORLD and impl->comm != MPI_COMM_SELF and impl->comm != MPI_COMM_NULL)
    MPI_Comm_free(&impl->comm);
  delete impl;
}

Communicator::Communicator(MPI_Comm const &comm) : impl(nullptr), session(session_singleton()) {
  if (comm == MPI_COMM_NULL) return;
  int size, rank;
  MPI_Comm_size(comm, &size);
  MPI_Comm_rank(comm, &rank);

  Impl const data{comm, static_cast<t_uint>(size), static_cast<t_uint>(rank)};
  impl = std::shared_ptr<Impl const>(new Impl(data), &delete_comm);
}

void Communicator::abort(const std::string &reason) const {
  fprintf(stderr, "MPI Error on Rank %i: %s\n", rank(), reason.c_str());
  MPI_Abort(**this, MPI_ERR_OTHER);
}

Communicator Communicator::duplicate() const {
  if (not impl) return Communicator(MPI_COMM_NULL);
  MPI_Comm comm;
  MPI_Comm_dup(**this, &comm);
  return comm;
}

std::string Communicator::broadcast(std::string const &input, t_uint const root) const {
  if (not impl) return input;
  if (rank() == root) {
    auto const N = broadcast(input.size(), root);
    MPI_Bcast(const_cast<std::string::pointer>(input.c_str()), N,
              Type<std::string::value_type>::value, root, **this);
    return input;
  }
  auto const N = broadcast(input.size(), root);
  std::string result(N, ' ');
  MPI_Bcast(const_cast<std::string::pointer>(result.c_str()), N,
            Type<std::string::value_type>::value, root, **this);
  return result;
}

}  // namespace mpi
}  // namespace sopt
