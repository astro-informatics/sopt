#ifndef SOPT_L1_FORWARD_BACKWARD_H
#define SOPT_L1_FORWARD_BACKWARD_H

#include "sopt/config.h"
#include <numeric>
#include <tuple>
#include <utility>

#include "sopt/forward_backward.h"
#include "sopt/imaging_forward_backward.h"

#include "sopt/exception.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/proximal.h"
#include "sopt/relative_variation.h"
#include "sopt/types.h"

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
  
  typedef typename FB::value_type value_type;
  typedef typename FB::Scalar Scalar;
  typedef typename FB::Real Real;
  typedef typename FB::t_Vector t_Vector;
  typedef typename FB::t_LinearTransform t_LinearTransform;
  
  typedef typename FB::t_Proximal t_Proximal;
  typedef typename FB::t_Gradient t_Gradient;
  typedef typename FB::t_IsConverged t_IsConverged;

  // Constructor for L1ForwardBackward.
  // Call constructor of base class and constructor of l1_proximal
  template <class DERIVED>
  L1ForwardBackward(Eigen::MatrixBase<DERIVED> const &target) : l1_proximal_(), IFB::ImagingForwardBackward(target) {}

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
  typename std::enable_if<sizeof...(ARGS) >= 1, L1ForwardBackward<Scalar> &>::type Psi(
      ARGS &&... args) {
    l1_proximal().Psi(std::forward<ARGS>(args)...);
    return *this;
  }

  // Override getters from base class
  // We want to return a reference of type L1ForwardBackward (this class) instead
  // of ImagingForwardBackward (base class)
  // We want to keep the overloads of these functions from the base class with the using keyword.
  // https://stackoverflow.com/questions/888235/overriding-a-bases-overloaded-function-in-c
  using IFB::l2_gradient;
  L1ForwardBackward<SCALAR>& l2_gradient(t_Gradient const &arg) {
    IFB::l2_gradient(arg);
    return *this;
  }
  using IFB::tight_frame;
  L1ForwardBackward<SCALAR>& tight_frame(bool const &arg) {
    IFB::tight_frame(arg);
    return *this;
  }
  using IFB::residual_tolerance;
  L1ForwardBackward<SCALAR>& residual_tolerance(Real const &arg) {
    IFB::residual_tolerance(arg);
    return *this;
  }
  using IFB::relative_variation;
  L1ForwardBackward<SCALAR>& relative_variation(Real const &arg) {
    IFB::relative_variation(arg);
    return *this;
  }
  using IFB::residual_convergence;
  L1ForwardBackward<SCALAR>& residual_convergence(t_IsConverged const &arg) {
    IFB::residual_convergence(arg);
    return *this;
  }
  using IFB::objective_convergence;
  L1ForwardBackward<SCALAR>& objective_convergence(t_IsConverged const &arg) {
    IFB::objective_convergence(arg);
    return *this;
  }
  using IFB::itermax;
  L1ForwardBackward<SCALAR>& itermax(t_uint const &arg) {
    IFB::itermax(arg);
    return *this;
  }
  using IFB::gamma;
  L1ForwardBackward<SCALAR>& gamma(Real const &arg) {
    IFB::gamma(arg);
    return *this;
  }
  using IFB::beta;
  L1ForwardBackward<SCALAR>& beta(Real const &arg) {
    IFB::beta(arg);
    return *this;
  }
  using IFB::sigma;
  L1ForwardBackward<SCALAR>& sigma(Real const &arg) {
    IFB::sigma(arg);
    return *this;
  }
  using IFB::nu;
  L1ForwardBackward<SCALAR>& nu(Real const &arg) {
    IFB::nu(arg);
    return *this;
  }
  using IFB::is_converged;
  L1ForwardBackward<SCALAR>& is_converged(t_IsConverged const &arg) {
    IFB::is_converged(arg);
    return *this;
  }
  using IFB::Phi;
  L1ForwardBackward<SCALAR>& Phi(t_LinearTransform const &arg) {
    IFB::Phi(arg);
    return *this;
  }
  using IFB::target;
  L1ForwardBackward<SCALAR>& target(t_Vector const &arg) {
    IFB::target(arg);
    return *this;
  }
#ifdef SOPT_MPI
  using IFB::obj_comm;
  L1ForwardBackward<SCALAR>& obj_comm(mpi::Communicator const &arg) {
    IFB::obj_comm(arg);
    return *this;
  }
  //mpi::Communicator const& obj_comm() { return IFB::obj_comm(); }
#endif

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
  L1ForwardBackward<Scalar> &NAME##_proximal_##VAR(		\
      decltype(std::declval<proximal::PROXIMAL<Scalar> const>().VAR()) VAR) {                      \
    NAME##_proximal().VAR(VAR);						\
    return *this;							\
  }
  SOPT_MACRO(itermax, l1, L1);
  SOPT_MACRO(tolerance, l1, L1);
  SOPT_MACRO(real_constraint, l1, L1);
  SOPT_MACRO(weights, l1, L1);
  SOPT_MACRO(nu, l1, L1);
  SOPT_MACRO(positivity_constraint, l1, L1);
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
    if (IFB::tight_frame()) {
      l1_proximal().tight_frame(out, gamma, x);
      return {0, 0, l1_proximal().objective(x, out, gamma), true};
    }
    return l1_proximal()(out, gamma, x);
  }

  // Print log message with the correct norms
  void operator_log_message() const override {
    SOPT_HIGH_LOG("Performing Forward Backward with L1 and L2 norms");
  }

  // Return g_proximal as a lambda function. Used in operator() in base class.
  t_Proximal get_proximal() const override {
    return [this](t_Vector &out, Real gamma, t_Vector const &x) {
	     this -> l1_proximal(out, gamma, x);
	   };
  }

  Real get_proximal_norm(t_Vector const &x) const override {
    return sopt::l1_norm(static_cast<t_Vector>(Psi().adjoint() * x), l1_proximal_weights());
  }
}; // class L1ForwardBackward
}  // namespace algorithm
}  // namespace sopt
#endif
