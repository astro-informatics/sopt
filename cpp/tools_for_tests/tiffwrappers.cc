#include <fstream>

#include "tools_for_tests/directories.h"
#include "tools_for_tests/tiffwrappers.h"
#include "sopt/types.h"
#include "sopt/utilities.h"

namespace sopt::notinstalled {
Image<> read_standard_tiff(std::string const &name) {
  std::string const stdname = "./test_data/" + name + ".tiff";
  bool const is_std = std::ifstream(stdname).good();
  return sopt::utilities::read_tiff(is_std ? stdname : name);
}
} // namespace sopt::notinstalled
