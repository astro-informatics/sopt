#ifndef SOPT_L1_FORWARD_BACKWARD_H
#define SOPT_L1_FORWARD_BACKWARD_H

#include "sopt/config.h"
#include <numeric>
#include <tuple>
#include <utility>

#include "sopt/l1_proximal.h"

namespace sopt {
namespace algorithm {

  // This class should contain everything included from l1_proximal.h that adds
  // features specific to the l1 proximal to the ImagingForwardBackward class
template <class SCALAR>
class L1ForwardBackward : public ImagingForwardBackward<SCALAR> {

  //! Underlying algorithm
  typedef ForwardBackward<SCALAR> FB;
  typedef ImagingForwardBackward<SCALAR> IFB;

public:

  // Diagnostic struct + its constructor
  // Inherit Diagnostic from base class and add Diagnostic from calling L1 proximal
  // Call base class constructors
  struct Diagnostic : public IFB::Diagnostic {
    typename proximal::L1<Scalar>::Diagnostic l1_diagnostic;

    Diagnostic(t_uint niters = 0u, bool good = false,
               typename proximal::L1<Scalar>::Diagnostic const &l1diag =
	       typename proximal::L1<Scalar>::Diagnostic())
      : IFB::Diagnostic(niters, good), l1_diagnostic(l1diag) {}
    Diagnostic(t_uint niters, bool good, typename proximal::L1<Scalar>::Diagnostic const &l1diag,
               t_Vector &&residual)
      : IFB::Diagnostic(niters, good, std::move(residual)),
	l1_diagnostic(l1diag) {}
  };

  // Constructor for L1ForwardBackward.
  // Call constructor of base class and constructor of l1_proximal
  template <class DERIVED>
  L1ForwardBackward(Eigen::MatrixBase<DERIVED> const &target)
    : l1_proximal_(), IFB::ImagingForwardBackward(&target) {}

  //  We are using proximal::L1 class here so hard to make generic. Moved to child class
  //  TODO: Can we just create a generic "proximal" class in the base that L1 inherits?
  //! \brief L1 proximal used during calculation
  //! \details Non-const version to setup the object.
  proximal::L1<Scalar> &l1_proximal() { return l1_proximal_; }

  // SOPT_MACRO has been written out for clarity, since we only declare l1_proximal.
  proximal::L1<Scalar> const &l1_proximal() const { return l1_proximal_; }
  L1ForwardBackward<SCALAR> &l1_proximal(proximal::L1<Scalar> const &l1_proximal) {
    l1_proximal_ = l1_proximal;
    return *this;
  }

  // Adds Psi to l1_proximal. No corresponding operator in l2 proximal.
  //! \brief Analysis operator Ψ
  //! \details Under-the-hood, the object is actually owned by the L1 proximal.
  t_LinearTransform const &Psi() const { return l1_proximal().Psi(); }
  //! Analysis operator Ψ
  template <class... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, ImagingForwardBackward<Scalar> &>::type Psi(
      ARGS &&... args) {
    l1_proximal().Psi(std::forward<ARGS>(args)...);
    return *this;
  }

  // Removed unused macros
  // Forwards get/setters to L1 and L2Ball proximals
  // In practice, we end up with a bunch of functions that make it simpler to set or get values
  // associated with the two proximal operators.
  // E.g.: `paddm.l1_proximal_itermax(100).l2ball_epsilon(1e-2).l1_proximal_tolerance(1e-4)`.
  // ~~~
#define SOPT_MACRO(VAR, NAME, PROXIMAL)					\
  /** \brief Forwards to l1_proximal **/				\
  decltype(std::declval<proximal::PROXIMAL<Scalar> const>().VAR()) NAME##_proximal_##VAR() const { \
    return NAME##_proximal().VAR();					\
  }									\
  /** \brief Forwards to l1_proximal **/				\
  ImagingForwardBackward<Scalar> &NAME##_proximal_##VAR(		\
      decltype(std::declval<proximal::PROXIMAL<Scalar> const>().VAR()) VAR) {                      \
    NAME##_proximal().VAR(VAR);						\
    return *this;							\
  }
  SOPT_MACRO(itermax, l1, L1);
  SOPT_MACRO(tolerance, l1, L1);
  SOPT_MACRO(real_constraint, l1, L1);
  SOPT_MACRO(weights, l1, L1);
#undef SOPT_MACRO

protected:

  // Added from written-out macro
  proximal::L1<Scalar> l1_proximal_;

  // The following two functions only exist in l1 proximal
  //! Calls l1 proximal operator, checking for real constraints and tight frame
  template <class T0, class T1>
  typename proximal::L1<Scalar>::Diagnostic l1_proximal(Eigen::MatrixBase<T0> &out, Real gamma,
                                                        Eigen::MatrixBase<T1> const &x) const {
    return l1_proximal_real_constraint()
               ? call_l1_proximal(out, gamma, x.real().template cast<typename T1::Scalar>())
               : call_l1_proximal(out, gamma, x);
  }

  //! Calls l1 proximal operator, checking for thight frame
  template <class T0, class T1>
  typename proximal::L1<Scalar>::Diagnostic call_l1_proximal(Eigen::MatrixBase<T0> &out, Real gamma,
                                                             Eigen::MatrixBase<T1> const &x) const {
    if (tight_frame()) {
      l1_proximal().tight_frame(out, gamma, x);
      return {0, 0, l1_proximal().objective(x, out, gamma), true};
    }
    return l1_proximal()(out, gamma, x);
  }

  // Print log message with the correct norms
  template <class SCALAR>
  void operator_log_message() {
    SOPT_HIGH_LOG("Performing Forward Backward with L1 and L2 norms");
  }

  // Return g_proximal as a lambda function. Used in operator() in base class.
  template <class SCALAR>
  auto get_proximal(t_Vector &out, Real gamma, t_Vector const &x){
    return [this, &result](t_Vector &out, Real gamma, t_Vector const &x) {
	     result.l1_diagnostic = this->l1_proximal(out, gamma, x);
	   };
  }

  auto get_proximal_norm() {
    return sopt::l1_norm;
  }

  auto get_proximal_weights() {
    return l1_proximal_weights();
  }

  auto get_proximal_x() {
    return Psi().adjoint * x;
  }

}
