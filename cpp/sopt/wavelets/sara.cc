#include "sopt/config.h"
#include "sara.h"

namespace sopt {
namespace wavelets {
SARA distribute_sara(SARA const &sara, t_uint size, t_uint rank) {
  auto const start = [](t_uint size, t_uint ncomms, t_uint rank) {
    return std::min(size, rank * (size / ncomms) + std::min(rank, size % ncomms));
  };
  auto const startw = start(sara.size(), size, rank);
  auto const endw = start(sara.size(), size, rank + 1);
  return SARA(sara.begin() + startw, sara.begin() + endw);
}
}
}
