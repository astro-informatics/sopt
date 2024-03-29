#ifndef SOPT_LOGGING_ENABLED_H
#define SOPT_LOGGING_ENABLED_H

#include "sopt/config.h"
#include <memory>
#include <string>
#include <Eigen/Core>
#include <spdlog/fmt/ostr.h>
#include <spdlog/spdlog.h>
#include <spdlog/sinks/stdout_sinks.h>
#include "sopt/exception.h"

using spdlogPtr = std::shared_ptr<spdlog::logger>;

#if FMT_VERSION >= 90000
    template <typename... Args>
    struct fmt::formatter< Eigen::Transpose<Args...> > : fmt::ostream_formatter {};

    template <typename T>
    struct fmt::formatter<std::complex<T>> : fmt::ostream_formatter {};
#endif

namespace sopt::logging {

  void set_level(std::string const &level, std::string const &name = "");

  //! \brief Initializes a logger.
  //! \details Logger only exists as long as return is kept alive.
  inline spdlogPtr initialize(std::string const &name = "") {
    const std::string loggerName = default_logger_name() + name;
    const spdlogPtr result = spdlog::stdout_logger_mt(loggerName);
    if (!spdlog::get(loggerName))  spdlog::register_logger(result);
    set_level(default_logging_level(), name);
    return result;
  }

  //! Returns shared pointer to logger or null if it does not exist
  inline spdlogPtr get(std::string const &name = "") {
    return spdlog::get(default_logger_name() + name);
  }

  //! \brief Sets loggin level
  //! \details Levels can be one of
  //!     - "trace"
  //!     - "debug"
  //!     - "info"
  //!     - "warn"
  //!     - "err"
  //!     - "critical"
  //!     - "off"
  inline void set_level(std::string const &level, std::string const &name) {
    const spdlogPtr logger = get(name);
    if (not logger) SOPT_THROW("No logger by the name of ") << name << ".\n";
  #define SOPT_MACRO(LEVEL) \
    if (level == #LEVEL) logger->set_level(spdlog::level::LEVEL)
    SOPT_MACRO(trace);
    else SOPT_MACRO(debug);
    else SOPT_MACRO(info);
    else SOPT_MACRO(warn);
    else SOPT_MACRO(err);
    else SOPT_MACRO(critical);
    else SOPT_MACRO(off);
  #undef SOPT_MACRO
    else SOPT_THROW("Unknown logging level ") << level << "\n";
  }

  inline bool has_level(std::string const &level, std::string const &name = "") {
    const spdlogPtr logger = get(name);
    if (not logger) return false;

  #define SOPT_MACRO(LEVEL) \
    if (level == #LEVEL) return logger->level() >= spdlog::level::LEVEL
    SOPT_MACRO(trace);
    else SOPT_MACRO(debug);
    else SOPT_MACRO(info);
    else SOPT_MACRO(warn);
    else SOPT_MACRO(err);
    else SOPT_MACRO(critical);
    else SOPT_MACRO(off);
  #undef SOPT_MACRO
    else SOPT_THROW("Unknown logging level ") << level << "\n";
  }
} // namespace sopt::logging

//! \macro For internal use only
#define SOPT_LOG_(NAME, TYPE, ...)                                          \
  if (auto sopt_logging_##__func__##_##__LINE__ = sopt::logging::get(NAME)) \
  sopt_logging_##__func__##_##__LINE__->TYPE(__VA_ARGS__)

#endif
