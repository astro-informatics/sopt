#define CATCH_CONFIG_RUNNER
#include <iterator>
#include <regex>
#include <vector>
#include "catch.hpp"
#include "sopt/logging.h"
#include "sopt/mpi/session.h"
using namespace sopt;

std::vector<char const *> cargs;
TEST_CASE("Create/delete session") {
  CHECK(mpi::initialized() == false);
  CHECK(mpi::finalized() == false);
  auto session = mpi::init(cargs.size(), cargs.data());
  CHECK(mpi::initialized() == true);
  CHECK(mpi::finalized() == false);
  session.reset();
  CHECK(mpi::initialized() == true);
  CHECK(mpi::finalized() == true);
}

int main(int argc, const char **argv) {
  Catch::Session session;  // There must be exactly once instance

  // Removes output qualifiers from arguments
  auto avoid = false;
  auto const N = std::string("--out=").size();
  std::vector<std::string> args(argv, argv + argc);
  for (auto const &arg : args)
    if (avoid)
      avoid = false;
    else if (arg == "-o" or arg == "--out")
      avoid = true;
    else if (arg.size() < N or arg.substr(0, N) != "--out=")
      cargs.push_back(arg.c_str());

  auto const returnCode = session.applyCommandLine(cargs.size(), const_cast<char **>(cargs.data()));
  if (returnCode != 0)  // Indicates a command line error
    return returnCode;

  sopt::logging::initialize();

  auto const result = session.run();
  return result;
}
