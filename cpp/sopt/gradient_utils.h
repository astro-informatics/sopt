#ifndef SOPT_GRADIENT_UTILS_H
#define SOPT_GRADIENT_UTILS_H

#include "sopt/types.h"
#include "sopt/linear_transform.h"
#include <memory>

namespace sopt {

//! A helper object that can hold the measurement operator
//! and the target vector for a given iteration state
template <typename T>
class IterationState {
  public:
  IterationState() = delete;

  IterationState(const T& target,
                 std::shared_ptr<sopt::LinearTransform<T>> phi)
                 : _target(target) {
    _phi = phi;
  }

  const T& target() const { return _target; }

  const sopt::LinearTransform<T>& phi() const { return *_phi; }

  private:
  const T _target;

  std::shared_ptr<sopt::LinearTransform<T>> _phi;
};

} // namespace sopt
#endif
