#ifndef SOPT_JOINT_MAP_H
#define SOPT_JOINT_MAP_H

#include "sopt/config.h"
#include <functional>
#include <limits>
#include <memory> // for std::shared_ptr<>
#include <utility> // for std::forward<>
#include "sopt/exception.h"
#include "sopt/forward_backward.h"
#include "sopt/imaging_forward_backward.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/types.h"

namespace sopt::algorithm {

template <typename ALGORITHM>
class JointMAP {
  using t_Vector = typename ALGORITHM::t_Vector;
  using t_Reg_Term = typename std::function<t_real (const t_Vector &)>;
  using ResultType = typename ALGORITHM::DiagnosticAndResult;
  //! Type of the convergence function
  using t_IsConverged = std::function<bool (const t_Vector &, const t_Vector &, const t_real)>;

 public:
  //! Holds results and reg parameter
  struct DiagnosticAndResultReg : public ResultType {
    t_real reg_term = 0;
    //! Wether convergence was achieved
    bool reg_good;
    //! Number of iterations
    t_uint reg_niters;
  };

  JointMAP(const std::shared_ptr<ALGORITHM> &algo_ptr, const t_Reg_Term &reg_term,
           const t_uint number_of_wavelet_coeffs)
      : algo_ptr_(algo_ptr),
        reg_term_(reg_term),
        alpha_(1),
        beta_(1),
        k_(1),
        number_of_wavelet_coeffs_(number_of_wavelet_coeffs),
        is_converged_([](t_Vector const &, t_Vector const &, t_real const) { return true; }),
        relative_variation_(1e-3),
        objective_variation_(1e-3),
        itermax_(std::numeric_limits<t_uint>::max()){}

#define SOPT_MACRO(NAME, TYPE)                  \
  TYPE const &NAME() const { return NAME##_; }  \
  JointMAP<ALGORITHM> &NAME(TYPE const &(NAME)) { \
    NAME##_ = NAME;                             \
    return *this;                               \
  }                                             \
                                                \
 protected:                                     \
  TYPE NAME##_;                                 \
                                                \
 public:

  //! Maximum number of iterations
  SOPT_MACRO(itermax, t_uint);
  //! Alpha parameter
  SOPT_MACRO(alpha, t_real);
  //! Beta parameter
  SOPT_MACRO(beta, t_real);
  //! k
  SOPT_MACRO(k, t_real);
  //! number of wavelet coeffs
  SOPT_MACRO(number_of_wavelet_coeffs, t_uint);
  //! Shared ptr with algorithm
  SOPT_MACRO(algo_ptr, std::shared_ptr<ALGORITHM>);
  //! Regularsation Term
  SOPT_MACRO(reg_term, t_Reg_Term);
  //! relative variation of reg parameter
  SOPT_MACRO(relative_variation, t_real);
  //! relative variation of objective_function
  SOPT_MACRO(objective_variation, t_real);
  //! \brief A function verifying convergence
  //! \details It takes as input two arguments: the current solution x and the current residual.
  SOPT_MACRO(is_converged, t_IsConverged);
#undef SOPT_MACRO
 protected:
  //! Checks input makes sense
  void sanity_check(t_real const &regulariser_strength, t_real const beta, t_real const alpha) const {
    if (regulariser_strength < 0) SOPT_THROW("Starting regularisation parameter not positive.");
    if (alpha < 0) SOPT_THROW("Alpha parameter not positive.");
    if (beta <= 0) SOPT_THROW("Beta not positive.");
  }

 public:
  //! \brief Calls Joint MAP estimation
  //! \param[out] out: Diagnostic and Solution
  template <typename... ARGS>
  DiagnosticAndResultReg operator()(ARGS &&... args) const {
    SOPT_HIGH_LOG("Performing Joint MAP estimation");

    ScalarRelativeVariation<t_real> scalvar(relative_variation(), relative_variation(),
                                            "Regularisation Parameter");
    ScalarRelativeVariation<t_real> objvar(objective_variation(), objective_variation(),
                                           "Joint Objective Function");
    sanity_check(this->algo_ptr_->regulariser_strength(), beta(), alpha());
    t_uint niters(0);
    bool converged = false;
    using ResultType = typename ALGORITHM::DiagnosticAndResult;
    ResultType result = (*(this->algo_ptr_))(std::forward<ARGS>(args)...);
    t_real regulariser_strength = 0;
    niters++;
    t_uint algo_iters(result.niters);
    for (; (not converged) && (niters < itermax()); ++niters) {
      SOPT_LOW_LOG("    - [JMAP] Iteration {}/{}", niters, itermax());
      regulariser_strength = (static_cast<t_real>(number_of_wavelet_coeffs()) / k() + alpha()) /
              (this->reg_term()(result.x) + beta());
      SOPT_LOW_LOG("    - [JMAP] Regularisation Parameter Value {}", regulariser_strength);
      algo_ptr_->regulariser_strength(regulariser_strength);
      result = (*algo_ptr_)(result);
      converged = result.good and scalvar(regulariser_strength) and objvar(algo_ptr_->objmin()) and
                  this->is_converged()(result.x, result.residual, regulariser_strength);
      algo_iters += result.niters;
    }

    if (converged) {
      SOPT_MEDIUM_LOG("    - [JMAP] converged in {} of {} iterations", niters, itermax());
    } else {
      // not meaningful if not convergence function
      SOPT_ERROR("    - [JMAP] did not converge within {} iterations", itermax());
    }
    SOPT_MEDIUM_LOG("    - Total Algorithm iterations {} ", algo_iters);
    DiagnosticAndResultReg diagnostic;
    static_cast<ResultType &>(diagnostic) = result;
    diagnostic.niters = algo_iters;
    diagnostic.reg_good = converged;
    diagnostic.reg_niters = niters;
    diagnostic.reg_term = regulariser_strength;
    return diagnostic;
  }
};

} // namespace sopt::algorithm

#endif
