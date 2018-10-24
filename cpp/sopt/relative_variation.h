#ifndef SOPT_RELATIVE_VARIATION_H
#define SOPT_RELATIVE_VARIATION_H

#include "sopt/config.h"
#include <string>
#include <Eigen/Core>
#include "sopt/logging.h"
#include "sopt/maths.h"

namespace sopt {

template <class TYPE>
class RelativeVariation {
 public:
  //! Underlying scalar type
  typedef TYPE Scalar;
  //! Underlying scalar type
  typedef typename real_type<Scalar>::type Real;
  //! Maximum variation from one step to the next
  RelativeVariation(Real tolerance = 1e-12, std::string const &name = "")
      : tolerance_(tolerance), previous_(typename Array<Scalar>::Index(0)), name_(name){};
  //! Copy constructor
  RelativeVariation(RelativeVariation const &c)
      : tolerance_(c.tolerance_), previous_(c.previous_){};

  //! True if object has changed by less than tolerance
  template <class T>
  bool operator()(Eigen::MatrixBase<T> const &input) {
    return operator()(input.array());
  }
  //! True if object has changed by less than tolerance
  template <class T>
  bool operator()(Eigen::ArrayBase<T> const &input);
  //! Allowed variation
  Real tolerance() const { return tolerance_; }
  //! Allowed variation
  RelativeVariation &tolerance(Real &e) const {
    tolerance_ = e;
    return *this;
  }
  //! Name that gets interpolated into the log's output
  std::string const &name() const { return name_; }
  RelativeVariation const &name(std::string const &name) const {
    name_ = name;
    return *this;
  }

 protected:
  Real tolerance_;
  Array<Scalar> previous_;
  std::string name_;
};

template <class TYPE>
class ScalarRelativeVariation {
 public:
  //! Underlying scalar type
  typedef TYPE Scalar;
  //! Underlying scalar type
  typedef typename real_type<Scalar>::type Real;
  //! Maximum variation from one step to the next
  ScalarRelativeVariation(Real relative_tolerance = 1e-12, Real absolute_tolerance = 1e-12,
                          std::string const &name = "")
      : name_(name),
        relative_tolerance_(relative_tolerance),
        absolute_tolerance_(absolute_tolerance),
        previous_(0),
        is_first_(true){};
  //! Copy constructor
  ScalarRelativeVariation(ScalarRelativeVariation const &c)
      : relative_tolerance_(c.relative_tolerance_),
        previous_(c.previous_),
        is_first_(c.is_first_){};

  //! True if object has changed by less than tolerance
  bool operator()(Scalar const &current);

  //! Allowed variation
  Real relative_tolerance() const { return relative_tolerance_; }
  //! Allowed variation
  RelativeVariation<Scalar> &relative_tolerance(Real &e) const {
    relative_tolerance_ = e;
    return *this;
  }
  //! Allowed variation
  Real absolute_tolerance() const { return relative_tolerance_; }
  //! Allowed variation
  RelativeVariation<Scalar> &absolute_tolerance(Real &e) const {
    absolute_tolerance_ = e;
    return *this;
  }

  //! Name that gets interpolated into the log's output
  std::string const &name() const { return name_; }
  ScalarRelativeVariation const &name(std::string const &name) const {
    name_ = name;
    return *this;
  }

 protected:
  std::string name_;
  Real relative_tolerance_;
  Real absolute_tolerance_;
  Scalar previous_;
  bool is_first_;
};

template <class SCALAR>
template <class T>
bool RelativeVariation<SCALAR>::operator()(Eigen::ArrayBase<T> const &input) {
  if (previous_.size() != input.size()) {
    previous_ = input;
    return false;
  }
  auto const norm = (input - previous_).matrix().squaredNorm();
  previous_ = input;
  SOPT_LOW_LOG("    - {} relative variation: {} <? {}", name(), std::sqrt(norm), tolerance());
  return norm < tolerance() * tolerance();
}

template <class SCALAR>
bool ScalarRelativeVariation<SCALAR>::operator()(Scalar const &current) {
  if (is_first_) {
    previous_ = current;
    is_first_ = false;
    return false;
  }
  auto const average = (std::abs(previous_) + std::abs(current)) * 0.5;
  auto const diff = std::abs(previous_ - current);
  auto const result =
      diff <= relative_tolerance() * std::abs(average) or std::abs(diff) < absolute_tolerance();
  SOPT_LOW_LOG("    - {} relative variation: {} < {} * {} or {} < {} is {}", name(), diff,
               relative_tolerance(), average, diff, absolute_tolerance(),
               result ? "true" : "false");
  previous_ = current;
  return result;
}
}  // namespace sopt

#endif
