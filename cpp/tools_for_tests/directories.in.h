#ifndef SOPT_DATA_DIR_H
#define SOPT_DATA_DIR_H

#include "sopt/config.h"
#include <string>

namespace sopt::tools {
//! Holds images and such
inline std::string data_directory() { return "@CMAKE_INSTALL_PREFIX@/test_data"; }
//! Output artefacts from tests
inline std::string output_directory() { return "@CMAKE_INSTALL_PREFIX@/outputs"; }
//! Machine-learning models
inline std::string models_directory() { return "@CMAKE_INSTALL_PREFIX@/test_data"; }
} // namespace sopt::tools
#endif
