#include <catch.hpp>
#include <memory>
#include <random>

#include "sopt/types.h"
#include "sopt/wavelets.h"

TEST_CASE("Wavelet transform innards with integer data", "[wavelet]") {
  using namespace sopt::wavelets;
  using namespace sopt;

  auto const world = mpi::Communicator::World();
  sopt::wavelets::SARA const serial{std::make_tuple("DB4", 5), std::make_tuple("DB8", 2)};
  CAPTURE(serial.size());
  CAPTURE(world.size());
  auto const leftover = serial.size() % world.size();
  auto const start =
      world.rank() * (serial.size() / world.size()) + std::min(world.rank(), leftover);
  auto const end = start + (serial.size() / world.size()) +
                   ((1 <= leftover and leftover > world.rank()) ? 1 : 0);

  sopt::wavelets::SARA const parallel(serial.begin() + start, serial.begin() + end);

  auto const Nx = 32;
  auto const Ny = 32;
  auto const psi_serial = linear_transform<t_real>(serial, Nx, Ny);
  auto const psi_parallel = linear_transform<t_real>(parallel, Nx, Ny, world);

  SECTION("Signal to Coefficients") {
    auto const signal = world.broadcast<Vector<t_real>>(Vector<t_real>::Random(Nx * Ny));
    Vector<t_real> const serial_coeffs =
        (psi_serial.adjoint() * signal).segment(start * Nx * Ny, (end - start) * Nx * Ny);
    Vector<t_real> const para_coeffs = psi_parallel.adjoint() * signal;
    CAPTURE(start);
    CAPTURE(end);
    CHECK(serial_coeffs.isApprox(para_coeffs));
  }

  SECTION("Coefficients to Signal") {
    auto const coefficients =
        world.broadcast<Vector<t_real>>(Vector<t_real>::Random(Nx * Ny * serial.size()));
    Vector<t_real> const serial_signal = (psi_serial * coefficients);
    Vector<t_real> const para_signal =
        psi_parallel * coefficients.segment(start * Nx * Ny, (end - start) * Nx * Ny);
    CHECK(serial_signal.isApprox(para_signal));
  }
}
