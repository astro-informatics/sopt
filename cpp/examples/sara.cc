#include <wavelets/sara.h>

int main(int, char const **) {

  // Creates SARA with two wavelets
  sopt::wavelets::SARA sara = {{"DB4", 5}, {"DB8", 2}};

  // Then another one for good measure
  sara.emplace_back("DB3", 7);

  // Creates a random signal
  sopt::t_cMatrix input = sopt::t_cMatrix::Random(128, 128);
  // Now gets its coefficients
  auto coefficients = sara.direct(input);
  // And transform back. We pass a pre-defined matrix explicitly to illustrate that API.
  // But we could just store the return value as above.
  sopt::t_cMatrix recover; // This matrix will be resized if necessary
  sara.indirect(coefficients, recover);

  // Check the reconstruction is corrrect
  if(not input.isApprox(recover))
    throw std::exception();

  // The coefficient for each wavelet basis is stored alongs columns:
  sopt::t_cMatrix const DB3_coeffs = sara[2].direct(input) / std::sqrt(sara.size());
  if(not coefficients.rightCols(input.cols()).isApprox(DB3_coeffs))
    throw std::exception();

  return 0;
}
