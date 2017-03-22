#include "sopt/config.h"
#include <exception>
#include <mpi.h>
#include "sopt/logging.h"
#include "sopt/mpi/session.h"
#include "sopt/types.h"

namespace sopt {
namespace mpi {

namespace details {
void initializer_tag::deleter(initializer_tag *tag) {
  if(not tag)
    return;

  delete tag;

  if(finalized())
    return;

  auto const error = MPI_Finalize();
  if(error != MPI_SUCCESS) {
    SOPT_ERROR("Error while calling MPI_Initialized ({})", error);
    throw std::runtime_error("MPI error");
  }
}
}

std::unique_ptr<details::initializer_tag, decltype(&details::initializer_tag::deleter)>
init(int argc, const char **argv) {
  if(initialized())
    return {nullptr, &details::initializer_tag::deleter};
  MPI_Init(&argc, const_cast<char ***>(&argv));
  return {new details::initializer_tag, &details::initializer_tag::deleter};
}

bool initialized() {
  int flag;
  auto const error = MPI_Initialized(&flag);
  if(error != MPI_SUCCESS) {
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
  if(finalized() or not initialized())
    return;
  MPI_Finalize();
}

} /* optimet::mpi  */
} /* optimet  */
