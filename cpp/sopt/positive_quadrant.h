#ifndef SOPT_PROJECTED_ALGORITHM_H
#define SOPT_PROJECTED_ALGORITHM_H

#include "sopt/linear_transform.h"
#include "sopt/types.h"

namespace sopt::algorithm {
//! \brief Computes according to given algorithm and then projects it to the positive quadrant
//! \details C implementation of the reweighted algorithms uses this, even-though the solutions are
//! already constrained to the positive quadrant.
template <class ALGORITHM>
class PositiveQuadrant {
 public:
  //! Underlying algorithm
  using Algorithm = ALGORITHM;
  //! Underlying scalar
  using Scalar = typename Algorithm::Scalar;
  //! Underlying vector
  using t_Vector = typename Algorithm::t_Vector;
  //! Underlying convergence functions
  using t_IsConverged = typename Algorithm::t_IsConverged;
  //! Underlying result type
  using Diagnostic = typename ALGORITHM::Diagnostic;
  //! Underlying result type
  using DiagnosticAndResult = typename ALGORITHM::DiagnosticAndResult;

  PositiveQuadrant(Algorithm const &algo) : algorithm_(algo) {}
  PositiveQuadrant(Algorithm &&algo) : algorithm_(std::move(algo)) {}

  Algorithm &algorithm() { return algorithm_; }
  Algorithm const &algorithm() const { return algorithm_; }

  //! Performs algorithm and project results onto positive quadrant
  template <class... T>
  Diagnostic operator()(t_Vector &out, T const &... args) const {
    auto const diagnostic = algorithm()(out, std::forward<T const &>(args)...);
    out = positive_quadrant(out);
    return diagnostic;
  };

  //! Performs algorithm and project results onto positive quadrant
  template <class... T>
  DiagnosticAndResult operator()(T const &... args) const {
    auto result = algorithm()(std::forward<T const &>(args)...);
    result.x = positive_quadrant(result.x);
    return result;
  };

 protected:
  //! Underlying algorithm
  Algorithm algorithm_;
};

//! Extended algorithm where the solution is projected on the positive quadrant
template <class ALGORITHM>
PositiveQuadrant<ALGORITHM> positive_quadrant(ALGORITHM const &algo) {
  return {algo};
}
} // namespace sopt::algorithm

#endif
