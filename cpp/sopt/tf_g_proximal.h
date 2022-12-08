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
    : model_(filename), square_image_(true) {}
  TFGProximal(const string& filename, const int rows, const int cols)
    : model_(filename), square_image_(false), image_rows_(rows), image_cols_(cols) {}
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
  int image_rows_;
  int image_cols_;
  bool square_image_;
  std::string const model_param_1 = "serving_default_input0:0";
  std::string const model_param_2 = "StatefulPartitionedCall:0";

  void call_model(t_Vector &out, t_Vector const &x) {
    // Set dimensions
    int const image_size = x.size();
    if (square_image_) {
      image_rows_ = static_cast<int>(sqrt(image_size));
      image_cols_ = static_cast<int>(sqrt(image_size));
    }

    // Process input
    std::vector<SCALAR> values(&x[0], x.data()+x.size());
    cppflow::tensor cf_tensor(values, {1, image_rows_, image_cols_, 1});
    // auto input = cppflow::expand_dims(cf_tensor, 0);
    // input = cppflow::expand_dims(input, -1);

    // Call model
    auto model_output = model_({{model_param_1, cf_tensor}}, {model_param_2});

    // Process output
    auto floatResults = model_output[0].get_data<float>();
    std::vector<SCALAR> typecastResults(floatResults.begin(), floatResults.end());
    Eigen::Map<Eigen::Matrix<SCALAR, Eigen::Dynamic, 1>> out(typecastResults.data(), image_size);

  }

};
}
}
#endif
