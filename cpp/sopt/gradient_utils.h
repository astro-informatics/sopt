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
                 std::shared_ptr<sopt::LinearTransform<T>> Phi)
                 : _target(target) {
    _Phi = Phi;
  }

  const T& target() const { return _target; }

  const sopt::LinearTransform<T>& Phi() const { return *_Phi; }

  private:
  const T _target;

  std::shared_ptr<sopt::LinearTransform<T>> _Phi;
};

} // namespace sopt
#endif
