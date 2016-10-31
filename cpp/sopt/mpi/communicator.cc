#include <exception>
#include <mpi.h>
#include "Communicator.h"

namespace sopt { namespace mpi {

void Communicator::delete_comm(Communicator::Impl *const impl) {
  if(impl->comm != MPI_COMM_WORLD)
    MPI_Comm_free(&impl->comm);
  delete impl;
}

Communicator::Communicator(MPI_Comm const& comm) : impl(nullptr) {
  int size, rank;
  MPI_Comm_size(comm, &size);
  MPI_Comm_rank(comm, &rank);

  Impl const data{comm, static_cast<t_uint>(size), static_cast<t_uint>(rank)};
  impl = std::shared_ptr<Impl const>(new Impl(data), &delete_comm);
}

Communicator Communicator::duplicate() const {
  if(not impl)
    return Communicator(nullptr);
  MPI_Comm comm;
  MPI_Comm_dup(**this, &comm);
  return comm;
}

} /* sopt::mpi */
} /* sopt  */
