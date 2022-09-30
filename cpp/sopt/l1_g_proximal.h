#ifndef SOPT_L1_G_PROXIMAL_H
#define SOPT_L1_G_PROXIMAL_H

#include "sopt/config.h"
#include <numeric>
#include <tuple>
#include <utility>
#include "sopt/forward_backward.h"
#include "sopt/l1_proximal.h"
#include "sopt/g_proximal.h"

namespace sopt {
namespace algorithm {

// Implementation of g_proximal with l1 proximal.
// Owns the private object l1_proximal_ and implements the
// interface defined by the GProximal class
template <class SCALAR> class L1GProximal : public GProximal {

  typedef ForwardBackward<SCALAR> FB;
  typedef typename FB::Real Real;
  typedef typename FB::t_Vector t_Vector;
  typedef typename FB::t_Proximal t_Proximal;

  L1GProximal() {
    l1_proximal_();
  };
  ~L1GProximal() {};

public:

  //! \brief Analysis operator Ψ
  //! \details Under-the-hood, the object is actually owned by the L1 proximal.
  t_LinearTransform const &Psi() const override { return l1_proximal().Psi(); }
  //! Analysis operator Ψ
  template <class... ARGS> void Psi(ARGS &&... args) override {
    l1_proximal().Psi(std::forward<ARGS>(args)...);
  }

  // Print log message with the correct norms
  void log_message() const override {
    SOPT_HIGH_LOG("Performing Forward Backward with L1 and L2 norms");
  }

  Real proximal_norm(t_Vector const &x) const override {
    return sopt::l1_norm(static_cast<t_Vector>(Psi().adjoint() * x), l1_proximal_weights());
  }

  // Return g_proximal as a lambda function. Used in operator() in base class.
  t_Proximal proximal_function() const override {
    return [this](t_Vector &out, Real gamma, t_Vector const &x) {
	     this -> l1_proximal(out, gamma, x);
	   };
  }

protected:

  proximal::L1<Scalar> l1_proximal_;

  //! \brief L1 proximal used during calculation
  //! \details Non-const version to setup the object.
  proximal::L1<Scalar> &l1_proximal() { return l1_proximal_; }

  // Helper functions for calling l1_proximal
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

}
}
}
