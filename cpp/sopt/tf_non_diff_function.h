#ifndef SOPT_TF_NON_DIFF_FUNCTION_H
#define SOPT_TF_NON_DIFF_FUNCTION_H
// TODO: Clean up unnecessary includes
#include "sopt/config.h"
#include "sopt/exception.h"
#include "sopt/forward_backward.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/ort_session.h"
#include "sopt/proximal.h"
#include "sopt/relative_variation.h"
#include "sopt/types.h"
#include "sopt/non_differentiable_func.h"

#include <numeric>
#include <string>
#include <tuple>
#include <utility>

namespace sopt::algorithm {

// Implementation of non differentiable function g(x) with a TensorFlow model. 
// The function represents an l1 norm.
// The "proximal" operator is implemented using the neural net model (denoiser).
template <typename SCALAR>
class TFGProximal : public NonDifferentiableFunc<SCALAR> {

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
  Real function(t_Vector const &x) const override {
    auto weights = Vector<Real>::Ones(x.size());
    return sopt::l1_norm(static_cast<t_Vector>(x), weights);
  }

  // Return g_proximal as a lambda function. Used in operator() in base class.
  t_Proximal proximal_operator() const override {
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

    // Scale to [0,1] in reals
    Vector<float> real_image(image_size);
    for (size_t i = 0; i < image_size; i++) {
      if constexpr (std::is_same<SCALAR, t_complex>::value) {
        real_image[i] = image_in[i].real();
      } else {
        real_image[i] = image_in[i];
      }
    }
    auto min = *(std::min_element(real_image.begin(), real_image.end()));
    auto max = *(std::max_element(real_image.begin(), real_image.end()));
    for(size_t i = 0; i < image_size; i++)
    {
      real_image[i] = (real_image[i] - min)/max;
    }
    
    // Call model
    Vector<float> computed_image = model_.compute(real_image, {1,nrows,ncols,1});

    // rescale back
    for(size_t i = 0; i < image_size; i++)
    {
      if constexpr (std::is_same<SCALAR, t_complex>::value) {
        image_out[i] = t_complex(computed_image[i] * max + min, 0);
      } else {
        image_out[i] = computed_image[i] * max + min;
      }
    }
  }

};
} // namespace sopt::algorithm
#endif
