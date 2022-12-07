#ifndef SOPT_TF_G_PROXIMAL_H
#define SOPT_TF_G_PROXIMAL_H
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

#include <cppflow/cppflow.h>
#include "cppflow/ops.h"
#include "cppflow/model.h"

namespace sopt {
namespace algorithm {

// Implementation of g_proximal with a TensorFlow model. Owns private
// object model_ and implements the
// interface defined by the GProximal class
template <class SCALAR>
class TFGProximal : public GProximal<SCALAR> {

public:
  typedef ForwardBackward<SCALAR> FB;
  typedef typename FB::Real Real;
  typedef typename FB::Scalar Scalar;
  typedef typename FB::t_Vector t_Vector;
  typedef typename FB::t_Proximal t_Proximal;
  typedef typename FB::t_LinearTransform t_LinearTransform;

  // The constructor constructs a cppflow model object from a saved model saved
  // to the file filename
  TFGProximal(const string& filename)
    : model_(filename) {}
  ~TFGProximal() {};

  // Print log message with the correct norms
  void log_message() const override {
    SOPT_HIGH_LOG("Performing Forward Backward TensorFlow model");
  }

  // Return the L1 norm of x with unit weights
  // TODO: What should we return here? 
  Real proximal_norm(t_Vector const &x) const override {
    Eigen::VectorXf::Ones(x.size()) weights;
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
    return linear_transform_identity();
  }

protected:

  cppflow::model model_;

  void call_model(t_Vector &out, t_Vector const &x) {
    out = model_({{"serving_default_input0:0", x}}, {"StatefulPartitionedCall:0"});
  }
  
};
}
}
#endif
