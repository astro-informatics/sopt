#ifndef SOPT_CPPFLOWUTILS_H
#define SOPT_CPPFLOWUTILS_H

#include "sopt/config.h"
#include <Eigen/Core>
#include "sopt/types.h"
#include <cppflow/cppflow.h>
#include "cppflow/ops.h"
#include "cppflow/model.h"

namespace sopt {
namespace cppflowutils {
//! Converts a sopt::Image to a cppflow::tensor
cppflow::tensor convert_image_to_tensor(sopt::Image<> const &image);
}  // namespace cppflowutils
}  // namespace sopt
#endif