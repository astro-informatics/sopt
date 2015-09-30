# Installs GBenchmark into build directory
include(PassonVariables)
passon_variables(GTest
    FILENAME "${EXTERNAL_ROOT}/src/GBenchmarkVariables.cmake"
    PATTERNS
        "CMAKE_[^_]*_R?PATH"
        "CMAKE_C_.*"
        "CMAKE_CXX_.*"
    ALSOADD
        "\nset(CMAKE_INSTALL_PREFIX \"${EXTERNAL_ROOT}\" CACHE STRING \"\")\n"
)

ExternalProject_Add(
    GBenchmark
    GIT_REPOSITORY https://github.com/google/benchmark.git
    PREFIX "${EXTERNAL_ROOT}"
    # Force separate output paths for debug and release builds to allow easy
    # identification of correct lib in subsequent TARGET_LINK_LIBRARIES commands
    CMAKE_ARGS
        -C "${EXTERNAL_ROOT}/src/GBenchmarkVariables.cmake"
        -DCMAKE_BUILD_TYPE=Release

    # Wrap download, configure and build steps in a script to log output
    UPDATE_COMMAND ""
    LOG_DOWNLOAD ON LOG_CONFIGURE ON LOG_BUILD ON LOG_INSTALL ON
)

add_recursive_cmake_step(GBenchmark DEPENDEES install)
