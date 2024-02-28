#ifndef SOPT_CPP_CONFIG_H
#define SOPT_CPP_CONFIG_H

//! Problems with using and constructors
#cmakedefine SOPT_HAS_USING
#ifndef SOPT_HAS_USING
#define SOPT_HAS_NOT_USING
#endif

//! True if using OPENMP
#cmakedefine SOPT_OPENMP

//! Macro to start logging or not
#cmakedefine SOPT_DO_LOGGING

//! Whether or not to include mpi
#cmakedefine SOPT_MPI

// figures out available basic types
#cmakedefine SOPT_CHAR_ARCH
#cmakedefine SOPT_LONG_ARCH
#cmakedefine SOPT_ULONG_ARCH


#include <string>
#include <tuple>

namespace sopt {

//! Returns library version
inline std::string version() { return "@SOPT_VERSION@"; }

//! Returns library version
inline std::tuple<uint8_t, uint8_t, uint8_t> version_tuple() {
  return std::tuple<uint8_t, uint8_t, uint8_t>(
      @SOPT_VERSION_MAJOR@, @SOPT_VERSION_MINOR@, @SOPT_VERSION_PATCH@);
}

//! Returns library git reference, if known
inline std::string gitref() { return "@SOPT_GITREF@"; }

//! Default logging level
inline std::string default_logging_level() { return "@SOPT_TEST_LOG_LEVEL@"; }

//! Default logger name
inline std::string default_logger_name() { return "@SOPT_LOGGER_NAME@"; }

# ifdef SOPT_OPENMP
//! Number of threads used during testing
inline constexpr std::size_t number_of_threads_in_tests() { return @SOPT_DEFAULT_OPENMP_THREADS@; }
# endif

} // namespace sopt

#endif
