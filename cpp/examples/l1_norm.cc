#include "sopt/maths.h"
#include "sopt/types.h"

int main(int /*unused*/, char const ** /*unused*/) {
  sopt::Image<std::complex<int>> input(2, 2);
  sopt::Image<std::complex<int>> weights(2, 2);
  input << 1, -2, 3, -4;
  weights << 5, 6, 7, 8;

  if (sopt::l1_norm(input, weights) != 1 * 5 + 2 * 6 + 3 * 7 + 4 * 8) {
    throw std::exception();
  }

  return 0;
}
