#include "sopt/mpi/session.h"
#include "sopt/config.h"
#include "sopt/exception.h"
#include <mpi.h>
#include "sopt/logging.h"
#include "sopt/types.h"

namespace sopt::mpi {

namespace details {
void initializer::deleter(initializer *tag) {
  if (not tag) return;

  delete tag;

  if (finalized() or not initialized()) return;

  auto const error = MPI_Finalize();
  if (error != MPI_SUCCESS) {
    SOPT_ERROR("Error while calling MPI_Initialized ({})", error);
    throw std::runtime_error("MPI error");
  }
}
std::weak_ptr<initializer> initializer::singleton;
}  // namespace details

std::shared_ptr<details::initializer> init(int argc, const char **argv) {
  if (finalized()) throw std::runtime_error("MPI session has already been finalized");
  if (not initialized()) {
    assert(details::initializer::singleton.expired());
    std::shared_ptr<details::initializer> ptr(new details::initializer,
                                              &details::initializer::deleter);
#ifdef SOPT_OPENMP
    int provided;
    if (MPI_Init_thread(&argc, const_cast<char ***>(&argv), MPI_THREAD_FUNNELED, &provided) ==
        MPI_SUCCESS)
#else
    if (MPI_Init(&argc, const_cast<char ***>(&argv)) == MPI_SUCCESS)
#endif
      details::initializer::singleton = ptr;

#ifdef SOPT_OPENMP
    if (provided < MPI_THREAD_FUNNELED) SOPT_THROW("MPI threading support not sufficient.");
#endif
    return details::initializer::singleton.lock();
  }
  return session_singleton();
}

std::shared_ptr<details::initializer> session_singleton() {
  if (not initialized()) throw std::runtime_error("MPI session not initialized");
  if (details::initializer::singleton.expired()) {
    std::shared_ptr<details::initializer> ptr(new details::initializer,
                                              &details::initializer::deleter);
    details::initializer::singleton = ptr;
    return details::initializer::singleton.lock();
  }
  return details::initializer::singleton.lock();
}

bool initialized() {
  int flag;
  auto const error = MPI_Initialized(&flag);
  if (error != MPI_SUCCESS) {
    SOPT_ERROR("Error while calling MPI_Initialized ({})", error);
    throw std::runtime_error("MPI error");
  }
  return static_cast<bool>(flag);
}

bool finalized() {
  int finalized;
  MPI_Finalized(&finalized);
  return finalized;
}

void finalize() {
  if (finalized() or not initialized()) return;
  MPI_Finalize();
}

} // namespace sopt::mpi
