#ifndef SOPT_TF_G_PROXIMAL_H
#define SOPT_TF_G_PROXIMAL_H
#include "sopt/config.h"
#include "sopt/exception.h"
#include "sopt/forward_backward.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/ort_session.h"
#include "sopt/proximal.h"
#include "sopt/relative_variation.h"
#include "sopt/types.h"
#include "sopt/g_proximal.h"

#include <numeric>
#include <string>
#include <tuple>
#include <utility>

namespace sopt::algorithm {

// Implementation of g_proximal with a TensorFlow model. Owns private
// object model_ and implements the
// interface defined by the GProximal class
template <typename SCALAR>
class TFGProximal : public GProximal<SCALAR> {

public:
  using FB = ForwardBackward<SCALAR>;
  using Real = typename FB::Real;
  using Scalar = typename FB::Scalar;
  using t_Vector = typename FB::t_Vector;
  using t_Proximal = typename FB::t_Proximal;
  using t_LinearTransform = typename FB::t_LinearTransform;

  // The constructor constructs a cppflow model object from a saved model saved
  // to the file filename
  TFGProximal(const std::string& path)
    : model_(path),
      Psi_(linear_transform_identity<Scalar>()) {}
  ~TFGProximal() {};

  // Print log message with the correct norms
  void log_message() const override {
    SOPT_HIGH_LOG("Performing Forward Backward TensorFlow model");
  }

  // Return the L1 norm of x with unit weights
  Real proximal_norm(t_Vector const &x) const override {
    auto weights = Vector<Real>::Ones(x.size());
    return sopt::l1_norm(static_cast<t_Vector>(x), weights);
  }

  // Return g_proximal as a lambda function. Used in operator() in base class.
  t_Proximal proximal_function() const override {
    return [this](t_Vector &out, Real gamma, t_Vector const &x) {
	     this -> call_model(out, x);
	   };
  }

  //! \brief Analysis operator Ψ
  // Psi is not implemented in this class, return an identity transform.
  t_LinearTransform const &Psi() const override {
    return Psi_;
  }

protected:

  t_LinearTransform Psi_;
  sopt::ORTsession model_;

  void call_model(t_Vector &image_out, t_Vector const &image_in) const {

    // Set dimensions
    int const image_size = image_in.size();
    int nrows = sqrt(image_size), ncols = sqrt(image_size);

    // Call model
    image_out = model_.compute(image_in, {1,nrows,ncols,1});

  }

};
} // namespace sopt::algorithm
#endif
