#ifndef SOPT_TF_G_PROXIMAL_H
#define SOPT_TF_G_PROXIMAL_H
// TODO: Clean up unnecessary includes
#include "sopt/config.h"
#include <numeric>
#include <string> // for std::string
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

#include "cppflow/cppflow.h"
#include "cppflow/ops.h"
#include "cppflow/model.h"
#include "sopt/cppflow_utils.h"

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
      square_image_(true),
      Psi_(linear_transform_identity<Scalar>()) {}
  TFGProximal(const std::string& path, const int rows, const int cols)
    : model_(path),
      square_image_(false),
      image_rows_(rows),
      image_cols_(cols),
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
  const cppflow::model model_;
  int image_rows_;
  int image_cols_;
  bool square_image_;

  void call_model(t_Vector &image_out, t_Vector const &image_in) const {
    // Set dimensions
    int const image_size = image_in.size();
    int image_rows = image_rows_;
    int image_cols = image_cols_;

    if (square_image_) {
      image_rows = static_cast<int>(sqrt(image_size));
      image_cols = static_cast<int>(sqrt(image_size));
    }

    // Process input
    cppflow::tensor const input_tensor = cppflowutils::convert_image_to_tensor(image_in, image_rows, image_cols);

    // Call model
    auto model_output = model_({{"serving_default_input0:0", input_tensor}}, {"StatefulPartitionedCall:0"});

    // Process output
    // TODO: We are assuming that the cppflow models operate on floats. This is not expected to change, but
    //       for robustness we should have the type as a template parameter, perhaps set in the constructor.
    // Added template keyword to suppress error on apple-clang, for reference
    // https://stackoverflow.com/questions/3786360/confusing-template-error
    auto output_vector = model_output[0].template get_data<float>();

    for(int i = 0; i < image_size; i++) {
      image_out[i] = static_cast<Scalar>(output_vector[i]);
    }
  }

};
} // namespace sopt::algorithm
#endif
