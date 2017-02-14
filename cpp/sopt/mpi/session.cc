#include "sopt/config.h"
#include <exception>
#include <mpi.h>
#include "sopt/mpi/session.h"
#include "sopt/types.h"

namespace sopt {
namespace mpi {
namespace {
bool &did_done_do_init() {
  static bool nrefs = false;
  return nrefs;
}
} // anonymous namespace

void init(int argc, const char **argv) {
  if(did_done_do_init())
    return;
  MPI_Init(&argc, const_cast<char ***>(&argv));
  did_done_do_init() = true;
}

bool initialized() { return did_done_do_init(); }

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
