#ifndef SOPT_MPI_COMMUNICATOR_H
#define SOPT_MPI_COMMUNICATOR_H

#include "sopt/config.h"

#ifdef SOPT_MPI

#include <memory>
#include <mpi.h>
#include <type_traits>
#include <vector>
#include "sopt/mpi/registered_types.h"
#include "sopt/types.h"

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
  Communicator() : impl() {}

  static Communicator World() { return Communicator(MPI_COMM_WORLD); }
  static Communicator Self() { return Communicator(MPI_COMM_SELF); }

  virtual ~Communicator(){};

  //! The number of processes
  decltype(Impl::size) size() const { return impl ? impl->size : 1; }
  //! The rank of this proc
  decltype(Impl::rank) rank() const { return impl ? impl->rank : 0; }
  //! Returns the Blacs context in a way blacs undersands
  decltype(Impl::comm) operator*() const { return impl ? impl->comm : nullptr; }
  //! Root id for this communicator
  static constexpr t_uint root_id() { return 0; }
  //! \brief Duplicates this communicator
  //! \details Creates a new communicator in all ways equivalent to this one.
  Communicator duplicate() const;
  //! Alias for duplicate
  Communicator clone() const { return duplicate(); }

  //! Helper function for reducing
  template <class T>
  typename std::enable_if<std::is_fundamental<T>::value, T>::type
  all_reduce(T const &value, MPI_Op operation) const;

  //! Helper function for reducing through sum
  template <class T>
  typename std::enable_if<std::is_fundamental<T>::value, T>::type
  all_sum_all(T const &value) const {
    return all_reduce(value, MPI_SUM);
  }

  //! Scatter one object per proc
  template <class T>
  typename std::enable_if<std::is_fundamental<T>::value, T>::type
  scatter_one(std::vector<T> const &values, Communicator const &comm,
              t_uint const root = root_id()) const;
  //! Receive scattered objects
  template <class T>
  typename std::enable_if<std::is_fundamental<T>::value, T>::type
  scatter_one(Communicator const &comm, t_uint const root = root_id()) const;

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

template <class T>
typename std::enable_if<std::is_fundamental<T>::value, T>::type
Communicator::all_reduce(T const &value, MPI_Op operation) const {
  if(size() == 1)
    return value;
  T result;
  MPI_Allreduce(&value, &result, 1, registered_type(value), operation, **this);
  return result;
}

template <class T>
typename std::enable_if<std::is_fundamental<T>::value, T>::type
Communicator::scatter_one(std::vector<T> const &values, Communicator const &comm,
    t_uint const root) const {
  assert(root < comm.size());
  if(values.size() != comm.size())
    throw std::runtime_error("Expected a single object per process");
  T result;
  MPI_Scatter(values.data(), 1, registered_type(result), &result, 1, registered_type(result),
      root, *comm);
  return result;
}
//! Receive scattered objects
template <class T>
typename std::enable_if<std::is_fundamental<T>::value, T>::type
Communicator::scatter_one(Communicator const &comm, t_uint const root) const {
  T result;
  MPI_Scatter(nullptr, 1, registered_type(result), &result, 1, registered_type(result), root,
      *comm);
  return result;
}

} /* optime::mpi */
} /* optimet */
#else
namespace sopt {
namespace mpi {
class Communicator {
public:
  constexpr t_uint size() const { return 1; }
  constexpr t_uint rank() const { return 0; }
  static constexpr t_uint root_id() const { return 0; }
};
}
}
#endif /* ifdef SOPT_MPI */
#endif /* ifndef SOPT_MPI_COMMUNICATOR */
