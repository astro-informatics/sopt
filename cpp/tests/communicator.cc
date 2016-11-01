#include <iostream>
#include <numeric>
#include "catch.hpp"

#include "sopt/config.h"
#include "sopt/mpi/communicator.h"

using namespace sopt;

#ifdef SOPT_MPI
TEST_CASE("Creates an mpi communicator") {
  int rank, size;
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  auto const world = mpi::Communicator::World();

  SECTION("General stuff") {
    REQUIRE(*world == MPI_COMM_WORLD);
    REQUIRE(static_cast<t_int>(world.rank()) == rank);
    REQUIRE(static_cast<t_int>(world.size()) == size);

    mpi::Communicator shallow = world;
    CHECK(*shallow == *world);
  }

  SECTION("Duplicate") {
    mpi::Communicator dup = world.duplicate();
    CHECK(*dup != *world);
  }

  SECTION("Scatter") {
    if(world.rank() == world.root_id()) {
      std::vector<t_int> scattered(world.size());
      std::iota(scattered.begin(), scattered.end(), 2);
      auto const result = world.scatter_one(scattered, world);
      CHECK(result == world.rank() + 2);
    } else {
      auto const result = world.scatter_one<t_int>(world);
      CHECK(result == world.rank() + 2);
    }
  }
}
#endif
