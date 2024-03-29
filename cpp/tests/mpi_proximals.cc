#include <catch2/catch_all.hpp>
#include <numeric>
#include <random>
#include <utility>

#include "sopt/proximal.h"
#include "sopt/types.h"

TEST_CASE("Parallel Euclidian norm", "[proximal]") {
  using namespace sopt;
  auto const world = mpi::Communicator::World();
  proximal::EuclidianNorm const eucl(world);

  Vector<t_real> out(5);
  Vector<t_real> x(5);
  x << 1, 2, 3, 4, 5;
  eucl(out, std::sqrt(world.all_sum_all(x.squaredNorm())) * 1.001, x);
  CHECK(out.isApprox(Vector<t_real>::Zero(x.size())));

  out = eucl(0.1, x);
  CHECK(out.isApprox(x * (1e0 - 0.1 / std::sqrt(world.all_sum_all(x.squaredNorm())))));
}

TEST_CASE("Parallel L2 ball", "[proximal]") {
  using namespace sopt;
  auto const world = mpi::Communicator::World();
  proximal::L2Ball<t_real> ball(0.5, world);
  Vector<t_real> out;
  Vector<t_real> x(5);
  x << 1, 2, 3, 4, 5;
  x *= world.rank();

  out = ball(0, x);
  CHECK(x.isApprox(out / 0.5 * std::sqrt(world.all_sum_all(x.squaredNorm()))));
  ball.epsilon(std::sqrt(world.all_sum_all(x.squaredNorm())) * 1.001);
  out = ball(0, x);
  CHECK(x.isApprox(out));
}

TEST_CASE("Parallel WeightedL2Ball", "[proximal]") {
  using namespace sopt;
  auto const world = mpi::Communicator::World();
  Vector<t_real> const weights = 0.01 * Vector<t_real>::Random(5).array() + 1e0;
  Vector<t_real> x(5);
  x << 1, 2, 3, 4, 5;
  x *= world.rank();
  proximal::WeightedL2Ball<t_real> wball(0.5, weights, world);
  proximal::L2Ball<t_real> const ball(0.5, world);

  Vector<t_real> const expected =
      ball((x.array() * weights.array()).matrix()).array() / weights.array();
  Vector<t_real> const actual = wball(x);
  CHECK(actual.isApprox(expected));

  wball.epsilon(std::sqrt(world.all_sum_all((x.array() * weights.array()).matrix().squaredNorm())) *
                1.001);
  CHECK(x.isApprox(wball(x)));
}
