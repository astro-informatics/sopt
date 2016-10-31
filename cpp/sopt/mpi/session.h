#ifndef SOPT_MPI_SESSION_H
#define SOPT_MPI_SESSION_H

#include "sopt/config.h"

#ifdef SOPT_MPI
#include <mpi.h>
#endif

namespace sopt {
namespace mpi {
#ifdef SOPT_MPI
//! Calls mpi init
void init(int argc, const char **argv);
//! True if mpi has been initialized
bool initialized();
//! True if mpi has been finalized
bool finalized();
//! Closes mpi stuff
void finalize();
#else
inline void init(int argc, const char **argv) {}
inline void finalize() {}
#endif
} /* sopt::mpi */
} /* sopt */
#endif /* ifndef SOPT_MPI_SESSION_H */
