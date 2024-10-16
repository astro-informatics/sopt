#ifndef SOPT_TIFF_WRAPPER_H
#define SOPT_TIFF_WRAPPER_H

#include "sopt/config.h"
#include <string> // for std::string
#include <Eigen/Core>
#include "sopt/types.h"

namespace sopt::tools {
//! Reads tiff image from sopt data directory if it exists
sopt::Image<> read_standard_tiff(std::string const &name);
} // namespace sopt::tools
#endif
