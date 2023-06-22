#include <vector>

//! Sparsity Averaging Reweighted Analysis
class SARA : public std::vector<int> {
 public:
  // Constructors
  using std::vector<int>::vector;
};

int main(int, char const**) {
  [[maybe_unused]] SARA s = {0, 0};
  return 0;
}
