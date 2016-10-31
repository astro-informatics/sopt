#include <iostream>
#include "catch.hpp"

#include "sopt/config.h"
#include "sopt/mpi/communicator.h"

using namespace sopt;

#ifdef SOPT_MPI
TEST_CASE("Creates an mpi communicator") {
  int rank, size;
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  mpi::Communicator const world;

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
}
#endif
