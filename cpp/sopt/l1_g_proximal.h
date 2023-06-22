#ifndef SOPT_L1_G_PROXIMAL_H
#define SOPT_L1_G_PROXIMAL_H
// TODO: Clean up unnecessary includes
#include "sopt/config.h"
#include <numeric>
#include <tuple>
#include <utility>
#include "sopt/exception.h"
#include "sopt/forward_backward.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/proximal.h"
#include "sopt/relative_variation.h"
#include "sopt/types.h"
#include "sopt/g_proximal.h"
#include "sopt/l1_proximal.h"

#ifdef SOPT_MPI
 #include "sopt/mpi/communicator.h"
#endif

namespace sopt {
namespace algorithm {

// Implementation of g_proximal with l1 proximal.
// Owns the private object l1_proximal_ and implements the
// interface defined by the GProximal class
template <class SCALAR>
class L1GProximal : public GProximal<SCALAR> {

public:
  typedef ForwardBackward<SCALAR> FB;
  typedef typename FB::Real Real;
  typedef typename FB::Scalar Scalar;
  typedef typename FB::t_Vector t_Vector;
  typedef typename FB::t_Proximal t_Proximal;
  typedef typename FB::t_LinearTransform t_LinearTransform;

  // In the constructor we need to construct the private l1_proximal_
  // object that contains the real implementation details. The tight_frame
  // parameter is required for internal logic in l1_proximal
  L1GProximal(bool tight_frame = false)
    : tight_frame_ (tight_frame),
      l1_proximal_() {}
  ~L1GProximal() {}

// Implements the interface in GProximal

  // Print log message with the correct norms
  void log_message() const override {
    SOPT_HIGH_LOG("Performing Forward Backward with L1 and L2 norms");
  }

  // Return the norm associated with this implementation
  Real proximal_norm(t_Vector const &x) const override {
    auto &weights = l1_proximal_weights();
    auto input = static_cast<t_Vector>(Psi().adjoint() * x);
    return sopt::l1_norm(input, weights);
  }

  // Return g_proximal as a lambda function. Used in operator() in base class.
  t_Proximal proximal_function() const override {
    return [this](t_Vector &out, Real gamma, t_Vector const &x) {
	     this -> l1_proximal(out, gamma, x);
	   };
  }

  //! \brief Analysis operator Ψ
  //! \details Under-the-hood, the object is actually owned by the l1 proximal.
  t_LinearTransform const &Psi() const override {
    return l1_proximal().Psi();
  }


// All the public properties below are specific to the l1 proximal
// and therefore not part of the interface

//! \brief L1 proximal used during calculation
//! \details Non-const version to setup the object.
  proximal::L1<Scalar> &l1_proximal() { return l1_proximal_; }
  proximal::L1<Scalar> const &l1_proximal() const { return l1_proximal_; }
  L1GProximal<SCALAR> &l1_proximal(proximal::L1<Scalar> const &arg) {
    l1_proximal_ = arg;
    return *this;
  }

// This macro creates get/setters that point to l1_proximal
// In practice, we end up with a bunch of functions that make it simpler to set or get values
// associated with the two proximal operators.
// E.g.: `paddm.l1_proximal_itermax(100).l1_proximal_tolerance(1e-4)`.
// ~~~
#define SOPT_MACRO(VAR, TYPE)						 \
  /** \brief Getter, forwards to l1_proximal **/                         \
  TYPE const &l1_proximal_##VAR() const { return l1_proximal().VAR(); }  \
  /** \brief Setter, forwards to l1_proximal **/                         \
  L1GProximal<SCALAR> &l1_proximal_##VAR(TYPE const ARG) {               \
    l1_proximal().VAR(ARG);				                 \
    return *this;                                                        \
  }

  SOPT_MACRO(itermax, t_uint);
  SOPT_MACRO(tolerance, Real);
  SOPT_MACRO(positivity_constraint, bool);
  SOPT_MACRO(real_constraint, bool);
  SOPT_MACRO(nu, Real);
  SOPT_MACRO(weights, Vector<t_real>);
#ifdef SOPT_MPI
  SOPT_MACRO(adjoint_space_comm, mpi::Communicator);
  SOPT_MACRO(direct_space_comm, mpi::Communicator);
#endif
#undef SOPT_MACRO

  //! Analysis operator Ψ
  template <class... ARGS>
  typename std::enable_if<sizeof...(ARGS) >= 1, L1GProximal<SCALAR> &>::type Psi(
      ARGS &&... args) {
    l1_proximal().Psi(std::forward<ARGS>(args)...);
    return *this;
  }

protected:

  bool tight_frame_;
  proximal::L1<Scalar> l1_proximal_;

  // Helper functions for calling l1_proximal
  //! Calls l1 proximal operator, checking for real constraints
  template <class T0, class T1>
  typename proximal::L1<Scalar>::Diagnostic l1_proximal(Eigen::MatrixBase<T0> &out, Real gamma,
                                                        Eigen::MatrixBase<T1> const &x) const {
    return l1_proximal_real_constraint()
      ? call_l1_proximal(out, gamma, x.real().template cast<typename T1::Scalar>())
      : call_l1_proximal(out, gamma, x);
  }

  //! Calls l1 proximal operator, checking for tight frame
  template <class T0, class T1>
  typename proximal::L1<Scalar>::Diagnostic call_l1_proximal(Eigen::MatrixBase<T0> &out, Real gamma,
                                                             Eigen::MatrixBase<T1> const &x) const {
    if (tight_frame_) {
      l1_proximal().tight_frame(out, gamma, x);
      return {0, 0, l1_proximal().objective(x, out, gamma), true};
    }
    return l1_proximal()(out, gamma, x);
  }

};
}
}
#endif
