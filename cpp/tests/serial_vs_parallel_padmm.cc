#include <catch.hpp>
#include <numeric>
#include <random>
#include <utility>

#include <sopt/imaging_padmm.h>
#include <sopt/logging.h>
#include <sopt/maths.h>
#include <sopt/mpi/communicator.h>
#include <sopt/mpi/utilities.h>
#include <sopt/relative_variation.h>
#include <sopt/sampling.h>
#include <sopt/types.h>
#include <sopt/utilities.h>
#include <sopt/wavelets.h>
// This header is not part of the installed sopt interface
// It is only present in tests
#include <tools_for_tests/directories.h>
#include <tools_for_tests/tiffwrappers.h>

TEST_CASE("Parallel vs serial inpainting") {
  extern std::unique_ptr<std::mt19937_64> mersenne;
  using namespace sopt;
  auto const world = mpi::Communicator::World();
  // split into serial and parallel
  auto const split_comm = world.split(world.is_root());
  if (world.size() < 2) return;

  // Some typedefs for simplicity
  typedef double Scalar;
  typedef sopt::Vector<Scalar> Vector;
  typedef sopt::Image<Scalar> Image;

  std::string const input = "cameraman256";
  // Read input file
  Image const image = world.is_root()
                          ? world.broadcast(sopt::notinstalled::read_standard_tiff(input))
                          : world.broadcast<Image>();

  // Initializing sensing operator
  // The operator is obtained by world root proc and split across the procs in split_comm
  sopt::t_uint nmeasure = 0.33 * image.size();
  auto indices = world.is_root()
                     ? world.broadcast(sopt::Sampling(image.size(), nmeasure, *mersenne).indices())
                     : world.broadcast<std::vector<t_uint>>();
  if (split_comm.size() > 1) {
    auto const copy = indices;
    auto const N = indices.size() / split_comm.size() +
                   (split_comm.rank() < indices.size() % split_comm.size() ? 1 : 0);
    auto const start = split_comm.rank() * (indices.size() / split_comm.size()) +
                       std::min(indices.size() % split_comm.size(), split_comm.rank());
    indices.resize(N);
    std::copy(copy.begin() + start, copy.begin() + N + start, indices.begin());
  }
  auto const sampling = sopt::linear_transform<Scalar>(sopt::Sampling(image.size(), indices));

  // Initializing wavelets
  auto const wavelet = sopt::wavelets::factory("DB4", 4);
  auto const psi = sopt::linear_transform<Scalar>(wavelet, image.rows(), image.cols());

  // Computing proximal-ADMM parameters
  Vector const y0 = sampling * Vector::Map(image.data(), image.size());
  CHECK(y0.size() == indices.size());
  auto const snr = 30.0;
  auto const sigma = y0.stableNorm() / std::sqrt(y0.size()) * std::pow(10.0, -(snr / 20.0));
  auto const epsilon = world.broadcast(std::sqrt(nmeasure + 2 * std::sqrt(y0.size())) * sigma);

  // Create dirty vector
  std::normal_distribution<> gaussian_dist(0, sigma);
  Vector y = world.is_root() ? y0 : world.broadcast<Vector>();
  if (world.is_root()) {
    for (sopt::t_int i = 0; i < y0.size(); i++) y(i) += gaussian_dist(*mersenne);
    world.broadcast(y);
  }
  if (split_comm.size() > 1) {
    auto const N =
        y.size() / split_comm.size() + (split_comm.rank() < y.size() % split_comm.size() ? 1 : 0);
    auto const start = split_comm.rank() * (y.size() / split_comm.size()) +
                       std::min(y.size() % split_comm.size(), split_comm.rank());
    y = y.segment(start, N).eval();
  }
  CHECK(y.size() == indices.size());

  // Creating proximal-ADMM Functor
  auto padmm =
      sopt::algorithm::ImagingProximalADMM<Scalar>(y)
          .itermax(4)
          .gamma(1e-1)
          .relative_variation(5e-4)
          .l2ball_proximal(sopt::proximal::WeightedL2Ball<Scalar>(epsilon).communicator(split_comm))
          .tight_frame(false)
          .l1_proximal_tolerance(1e-2)
          .l1_proximal_nu(1)
          .l1_proximal_itermax(50)
          .l1_proximal_positivity_constraint(true)
          .l1_proximal_real_constraint(true)
          .lagrange_update_scale(0.9)
          .nu(1e0)
          .Psi(psi);
  LinearTransform<Vector> const parallel_sampling(
      [&sampling](Vector &out, Vector const &input) { out = sampling * input; }, sampling.sizes(),
      [&sampling, split_comm](Vector &out, Vector const &input) {
        out = sampling.adjoint() * input;
        split_comm.all_sum_all(out);
      },
      sampling.adjoint().sizes());
  padmm.Phi(parallel_sampling);
  padmm.residual_convergence([&padmm, split_comm, world](Vector const &,
                                                         Vector const &residual) mutable -> bool {
    auto const residual_norm =
        sopt::mpi::l2_norm(residual, padmm.l2ball_proximal_weights(), split_comm);
    SOPT_LOW_LOG("    - [PADMM] Residuals: {} <? {}", residual_norm, padmm.residual_tolerance());
    CHECK(residual_norm == Approx(world.broadcast(residual_norm, world.root_id())));
    return residual_norm < padmm.residual_tolerance();
  });
  sopt::ScalarRelativeVariation<Scalar> conv(padmm.relative_variation(), padmm.relative_variation(),
                                             "Objective function");
  padmm.objective_convergence(
      [&padmm, split_comm, conv, world](Vector const &x, Vector const &) mutable -> bool {
        auto const result = conv(
            sopt::mpi::l1_norm(padmm.Psi().adjoint() * x, padmm.l1_proximal_weights(), split_comm));
        CHECK(result == (world.broadcast<int>(result, world.root_id()) != 0));
        return result;
      });
  padmm.is_converged([world](Vector const &image, Vector const &) -> bool {
    auto const from_root = world.broadcast(image);
    CHECK(from_root.isApprox(image, 1e-12));
    return true;
  });

  auto const diagnostic = padmm();
  CHECK(diagnostic.good == (world.broadcast<int>(diagnostic.good, world.root_id()) != 0));
  CHECK(diagnostic.x.isApprox(world.broadcast(diagnostic.x)));
}
