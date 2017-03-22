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
struct initializer_tag {
  static void deleter(initializer_tag *tag);
};
}
//! Calls mpi init
std::unique_ptr<details::initializer_tag, decltype(&details::initializer_tag::deleter)>
init(int argc, const char **argv);
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
