#ifndef SOPT_SAMPLING_H
#define SOPT_SAMPLING_H

#include "sopt/config.h"
#include <initializer_list>
#include <memory>
#include <random>
#include <vector> // for std::vector<>
#include <Eigen/Core>
#include "sopt/linear_transform.h"
#include "sopt/types.h"

namespace sopt {

//! \brief An operator that samples a set of measurements.
//! \details Picks some elements from a vector
class Sampling {
 public:
  //! Constructs from a vector
  Sampling(t_uint size, std::vector<t_uint> const &indices) : indices_(indices), size(size) {}
  //! Constructs from the size and the number of samples to pick
  template <typename RNG>
  Sampling(t_uint size, t_uint samples, RNG &&rng);
  //! Constructs from the size and the number of samples to pick
  Sampling(t_uint size, t_uint samples)
      : Sampling(size, samples, std::mt19937_64(std::random_device()())) {}

  // Performs sampling
  template <typename T0, typename T1>
  void operator()(Eigen::DenseBase<T0> &out, Eigen::DenseBase<T1> const &x) const;
  // Performs sampling
  template <typename T0, typename T1>
  void operator()(Eigen::DenseBase<T0> &&out, Eigen::DenseBase<T1> const &x) const {
    operator()(out, x);
  }
  // Performs adjunct of sampling
  template <typename T0, typename T1>
  void adjoint(Eigen::DenseBase<T0> &out, Eigen::DenseBase<T1> const &x) const;
  // Performs adjunct sampling
  template <typename T0, typename T1>
  void adjoint(Eigen::DenseBase<T0> &&out, Eigen::DenseBase<T1> const &x) const {
    adjoint(out, x);
  }

  //! Size of the vector returned by the adjoint operation
  t_uint cols() const { return size; }
  //! Number of measurements
  t_uint rows() const { return indices_.size(); }

  //! Indices of sampled points
  std::vector<t_uint> const &indices() const { return indices_; }

 protected:
  //! Set of indices to pick
  std::vector<t_uint> indices_;
  //! Original vector size
  t_uint size;
};

template <typename T0, typename T1>
void Sampling::operator()(Eigen::DenseBase<T0> &out, Eigen::DenseBase<T1> const &x) const {
  out.resize(indices_.size());
  for (decltype(indices_.size()) i(0); i < indices_.size(); ++i) {
    assert(indices_[i] < static_cast<t_uint>(x.size()));
    out[i] = x[indices_[i]];
  }
}

template <typename T0, typename T1>
void Sampling::adjoint(Eigen::DenseBase<T0> &out, Eigen::DenseBase<T1> const &x) const {
  assert(static_cast<t_uint>(x.size()) == indices_.size());
  out.resize(out.size());
  out.fill(0);
  for (decltype(indices_.size()) i(0); i < indices_.size(); ++i) {
    assert(indices_[i] < static_cast<t_uint>(out.size()));
    out[indices_[i]] = x[i];
  }
}

//! Returns linear transform version of this object.
template <typename T>
LinearTransform<Vector<T>> linear_transform(Sampling const &sampling) {
  return linear_transform<Vector<T>>(
      [sampling](Vector<T> &out, Vector<T> const &x) { sampling(out, x); },
      {{0, 1, static_cast<t_int>(sampling.rows())}},
      [sampling](Vector<T> &out, Vector<T> const &x) { sampling.adjoint(out, x); },
      {{0, 1, static_cast<t_int>(sampling.cols())}});
}

template <typename RNG>
Sampling::Sampling(t_uint size, t_uint samples, RNG &&rng) : indices_(size), size(size) {
  std::iota(indices_.begin(), indices_.end(), 0);
  std::shuffle(indices_.begin(), indices_.end(), rng);
  indices_.resize(samples);
}

}  // namespace sopt
#endif
