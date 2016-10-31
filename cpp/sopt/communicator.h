#ifndef SOPT_MPI_COMMUNICATOR_H
#define SOPT_MPI_COMMUNICATOR_H

#include "Types.h"

#ifdef SOPT_MPI

#include <memory>
#include <mpi.h>

namespace sopt {
namespace mpi {

//! \brief A C++ wrapper for an mpi communicator
//! \details All copies made of this communicator are shallow: they reference
//! the same communicator.
class Communicator {
  //! Holds actual data associated with mpi
  struct Impl {
    //! The blacs context
    MPI_Comm comm;
    //! The number of processes
    t_uint size;
    //! The rank of this object
    t_uint rank;
  };

public:
  //! World communicator
  Communicator() : Communicator(MPI_COMM_WORLD){};

  virtual ~Communicator(){};

  //! The number of processes
  decltype(Impl::size) size() const { return impl ? impl->size : 1; }
  //! The rank of this proc
  decltype(Impl::rank) rank() const { return impl ? impl->rank : 0; }
  //! Returns the Blacs context in a way blacs undersands
  decltype(Impl::comm) operator*() const { return impl->comm; }
  //! Root id for this communicator
  static constexpr t_uint root_id() { return 0; }
	//! \brief Duplicates this communicator
	//! \details Creates a new communicator in all ways equivalent to this one.
	Communicator duplicate() const;
	//! Alias for duplicate
	Communicator clone() const { return duplicate(); }

private:
  //! Holds data associated with the context
  std::shared_ptr<Impl const> impl;

  //! Deletes an mpi communicator
  static void delete_comm(Impl *impl);

  //! \brief Constructs a communicator
  //! \details Takes ownership of the communicator, unless it is MPI_COMM_WORLD.
  //! This means that once all the shared pointer to the impl are delete, the
  //! communicator will be
  //! released.
  Communicator(MPI_Comm const &comm);
};

} /* optime::mpi */
} /* optimet */
#else
namespace sopt {
namespace mpi {
class Communicator {
public:
  constexpr t_uint size() const { return 1; }
  constexpr t_uint rank() const { return 0; }
  constexpr t_uint root_id() const { return 0; }
};
}
}
#endif /* ifdef SOPT_MPI */
#endif /* ifndef SOPT_MPI_COMMUNICATOR */
