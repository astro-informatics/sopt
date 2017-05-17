#ifndef SOPT_MPI_SESSION_H
#define SOPT_MPI_SESSION_H

#include "sopt/config.h"
#include <memory>

#ifdef SOPT_MPI
#include <mpi.h>
#endif

namespace sopt {
namespace mpi {
#ifdef SOPT_MPI
namespace details {
struct initializer {
  static void deleter(initializer *tag);
  //! Gets singleton to session
  static std::weak_ptr<details::initializer> singleton;
};
}
//! Calls mpi init
std::shared_ptr<details::initializer> init(int argc, const char **argv);
std::shared_ptr<details::initializer> session_singleton();
//! True if mpi has been initialized
bool initialized();
//! True if mpi has been finalized
bool finalized();
#else
inline void init(int argc, const char **argv) {}
inline bool initialized() { return false; };
#endif
} /* sopt::mpi */
} /* sopt */
#endif /* ifndef SOPT_MPI_SESSION_H */
