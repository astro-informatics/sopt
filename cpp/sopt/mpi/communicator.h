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
  //! True if process is root
  bool is_root() const { return rank() == root_id(); }
  //! \brief Duplicates this communicator
  //! \details Creates a new communicator in all ways equivalent to this one.
  Communicator duplicate() const;
  //! Alias for duplicate
  Communicator clone() const { return duplicate(); }

  //! Helper function for reducing
  template <class T>
  typename std::enable_if<is_registered_type<T>::value, T>::type
  all_reduce(T const &value, MPI_Op operation) const;

  //! In-place reduction over an image
  template <class T>
  typename std::enable_if<is_registered_type<T>::value>::type
  all_reduce(Matrix<T> &image, MPI_Op operation) const {
    MPI_Allreduce(MPI_IN_PLACE, image.data(), image.size(), registered_type(T(0)), operation,
                  **this);
  }
  template <class T>
  typename std::enable_if<is_registered_type<T>::value>::type
  all_reduce(Image<T> &image, MPI_Op operation) const {
    MPI_Allreduce(MPI_IN_PLACE, image.data(), image.size(), registered_type(T(0)), operation,
                  **this);
  }
  template <class T>
  typename std::enable_if<is_registered_type<T>::value>::type
  all_reduce(Vector<T> &image, MPI_Op operation) const {
    MPI_Allreduce(MPI_IN_PLACE, image.data(), image.size(), registered_type(T(0)), operation,
                  **this);
  }

  //! Helper function for reducing through sum
  template <class T>
  typename std::enable_if<is_registered_type<T>::value, T>::type all_sum_all(T const &value) const {
    return all_reduce(value, MPI_SUM);
  }
  template <class T>
  typename std::enable_if<is_registered_type<typename T::Scalar>::value>::type
  all_sum_all(T &image) const {
    all_reduce(image, MPI_SUM);
  }

  //! Broadcasts object
  template <class T>
  typename std::enable_if<is_registered_type<T>::value, T>::type
  broadcast(T const &value, t_uint const root = root_id()) const;
  //! Receive broadcast object
  template <class T>
  typename std::enable_if<is_registered_type<T>::value, T>::type
  broadcast(t_uint const root = root_id()) const;
  template <class T>
  typename std::enable_if<is_registered_type<typename T::Scalar>::value, T>::type
  broadcast(T const &vec, t_uint const root = root_id()) const;
  template <class T>
  typename std::enable_if<is_registered_type<typename T::Scalar>::value, T>::type
  broadcast(t_uint const root = root_id()) const;
  template <class T>
  typename std::enable_if<is_registered_type<typename T::value_type>::value, T>::type
  broadcast(T const &vec, t_uint const root = root_id()) const;
  template <class T>
  typename std::enable_if<is_registered_type<typename T::value_type>::value, T>::type
  broadcast(t_uint const root = root_id()) const;

  //! Scatter one object per proc
  template <class T>
  typename std::enable_if<is_registered_type<T>::value, T>::type
  scatter_one(std::vector<T> const &values, t_uint const root = root_id()) const;
  //! Receive scattered objects
  template <class T>
  typename std::enable_if<is_registered_type<T>::value, T>::type
  scatter_one(t_uint const root = root_id()) const;

  //! Scatter
  template <class T>
  typename std::enable_if<is_registered_type<T>::value, Vector<T>>::type
  scatterv(Vector<T> const &vec, std::vector<t_int> const &sizes,
           t_uint const root = root_id()) const;
  template <class T>
  typename std::enable_if<is_registered_type<T>::value, Vector<T>>::type
  scatterv(t_int local_size, t_uint const root = root_id()) const;

  //! Split current communicator
  Communicator split(t_int color) const { return split(color, rank()); }
  //! Split current communicator
  Communicator split(t_int color, t_uint rank) const {
    MPI_Comm comm;
    MPI_Comm_split(**this, color, static_cast<t_int>(rank), &comm);
    return comm;
  }

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
typename std::enable_if<is_registered_type<T>::value, T>::type
Communicator::all_reduce(T const &value, MPI_Op operation) const {
  if(size() == 1)
    return value;
  T result;
  MPI_Allreduce(&value, &result, 1, registered_type(value), operation, **this);
  return result;
}

template <class T>
typename std::enable_if<is_registered_type<T>::value, T>::type
Communicator::scatter_one(std::vector<T> const &values, t_uint const root) const {
  assert(root < size());
  if(values.size() != size())
    throw std::runtime_error("Expected a single object per process");
  T result;
  MPI_Scatter(values.data(), 1, registered_type(result), &result, 1, registered_type(result), root,
              **this);
  return result;
}
//! Receive scattered objects
template <class T>
typename std::enable_if<is_registered_type<T>::value, T>::type
Communicator::scatter_one(t_uint const root) const {
  T result;
  MPI_Scatter(nullptr, 1, registered_type(result), &result, 1, registered_type(result), root,
              **this);
  return result;
}

template <class T>
typename std::enable_if<is_registered_type<T>::value, Vector<T>>::type
Communicator::scatterv(Vector<T> const &vec, std::vector<t_int> const &sizes,
                       t_uint const root) const {
  if(rank() != root)
    return scatterv<T>(sizes.at(rank()), root);
  std::vector<int> sizes_, displs;
  int i = 0;
  for(auto const size : sizes) {
    sizes_.push_back(static_cast<int>(size));
    displs.push_back(i);
    i += size;
  }
  if(vec.size() != i)
    throw std::runtime_error("Input vector size and sizes are inconsistent");

  Vector<T> result(sizes[rank()]);
  MPI_Scatterv(vec.data(), sizes_.data(), displs.data(), registered_type(T(0)), result.data(),
               sizes_[rank()], registered_type(T(0)), root, **this);
  return result;
}

template <class T>
typename std::enable_if<is_registered_type<T>::value, Vector<T>>::type
Communicator::scatterv(t_int local_size, t_uint const root) const {
  if(rank() == root)
    throw std::runtime_error("Root should call the *other* scatterv");
  std::vector<int> sizes(size());
  sizes[rank()] = local_size;
  Vector<T> result(sizes[rank()]);
  MPI_Scatterv(nullptr, sizes.data(), nullptr, registered_type(T(0)), result.data(), local_size,
               registered_type(T(0)), root, **this);
  return result;
}

template <class T>
typename std::enable_if<is_registered_type<T>::value, T>::type
Communicator::broadcast(T const &value, t_uint const root) const {
  assert(root < size());
  auto result = value;
  MPI_Bcast(&result, 1, registered_type(result), root, **this);
  return result;
}
//! Receive broadcast object
template <class T>
typename std::enable_if<is_registered_type<T>::value, T>::type
Communicator::broadcast(t_uint const root) const {
  if(root == root_id())
    throw std::runtime_error("Root process should call the *other* broadcasting function");
  assert(root < size());
  T result;
  MPI_Bcast(&result, 1, registered_type(result), root, **this);
  return result;
}

template <class T>
typename std::enable_if<is_registered_type<typename T::Scalar>::value, T>::type
Communicator::broadcast(T const &vec, t_uint const root) const {
  assert(root < size());
  auto const Nx = broadcast(vec.rows(), root);
  auto const Ny = broadcast(vec.cols(), root);
  auto result = vec;
  MPI_Bcast(result.data(), Nx * Ny, Type<typename T::Scalar>::value, root, **this);
  return result;
}
template <class T>
typename std::enable_if<is_registered_type<typename T::Scalar>::value, T>::type
Communicator::broadcast(t_uint const root) const {
  assert(root < size());
  auto const Nx = broadcast(decltype(std::declval<T>().rows())(0), root);
  auto const Ny = broadcast(decltype(std::declval<T>().cols())(0), root);
  T result(Nx, Ny);
  MPI_Bcast(result.data(), result.size(), Type<typename T::Scalar>::value, root, **this);
  return result;
}
template <class T>
typename std::enable_if<is_registered_type<typename T::value_type>::value, T>::type
Communicator::broadcast(T const &vec, t_uint const root) const {
  assert(root < size());
  auto const N = broadcast(vec.size(), root);
  auto result = vec;
  MPI_Bcast(result.data(), N, Type<typename T::value_type>::value, root, **this);
  return result;
}
template <class T>
typename std::enable_if<is_registered_type<typename T::value_type>::value, T>::type
Communicator::broadcast(t_uint const root) const {
  assert(root < size());
  auto const N = broadcast(decltype(std::declval<T>().size())(0), root);
  T result(N);
  MPI_Bcast(result.data(), result.size(), Type<typename T::value_type>::value, root, **this);
  return result;
}

} /* optime::mpi */
} /* optimet */
#endif /* ifdef SOPT_MPI */
#endif /* ifndef SOPT_MPI_COMMUNICATOR */
