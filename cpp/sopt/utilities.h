#ifndef SOPT_UTILITIES_H
#define SOPT_UTILITIES_H

#include "sopt/config.h"
#include <Eigen/Core>
#include "sopt/types.h"
#include <string>

namespace sopt::utilities {
//! Reads tiff image
sopt::Image<> read_tiff(std::string const &filename);
//! Writes a tiff greyscale file
void write_tiff(Image<> const &image, std::string const &filename);
} // namespace sopt::utilities
#endif
