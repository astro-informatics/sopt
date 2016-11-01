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
      auto const result = world.scatter_one(scattered);
      CHECK(result == world.rank() + 2);
    } else {
      auto const result = world.scatter_one<t_int>();
      CHECK(result == world.rank() + 2);
    }
  }

  SECTION("ScatterV") {
    std::vector<t_int> sizes(world.size()), displs(world.size());
    for(t_int i(0); i < world.rank(); ++i)
      sizes[i] = world.rank() * 2 + i;
    for(t_int i(1); i < world.rank(); ++i)
      displs[i] = displs[i - 1] + sizes[i - 1];
    Vector<t_int> const sendee
        = Vector<t_int>::Random(std::accumulate(sizes.begin(), sizes.end(), 0));
    auto const result = world.rank() == world.root_id() ?
                            world.scatterv(sendee, sizes) :
                            world.scatterv<t_int>(sizes[world.rank()]);
    CHECK(result.isApprox(sendee.segment(displs[world.rank()], sizes[world.rank()])));
  }

  SECTION("All sum all over image") {
    Image<t_int> image(2, 2);
    image.fill(world.rank());
    world.all_sum_all(image);
    CHECK((2 * image == world.size() * (world.size() - 1)).all());
  }
}
#endif
