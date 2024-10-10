cmake_minimum_required(VERSION 3.13.4) # CMake 3.13.4 is the currently default in Debian 10 repositories

# Do not allow in-source builds.
if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
	message(FATAL_ERROR "In-source builds are not allowed!\nCreate a \"build\" dir and remove:\n- ${CMAKE_SOURCE_DIR}/CMakeCache.txt\n- ${CMAKE_SOURCE_DIR}/CMakeFiles")
endif()

project(sopt
        DESCRIPTION "Sparse OPTimisation using state-of-the-art convex optimisation algorithms."
        HOMEPAGE_URL "http://astro-informatics.github.io/sopt/"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# https://cmake.org/cmake/help/latest/variable/CMAKE_EXPORT_COMPILE_COMMANDS.html
# Enable output of compile commands during generation. If enabled, generates a compile_commands.json file containing the exact compiler calls for all translation units of the project in machine-readable form. This can be consumed by various IDEs and static analysers to provide smarter project diagnostics/completions etc.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# https://stackoverflow.com/a/67410042
# Create a symlink to compile_commands.json located in CMAKE_BINARY_DIR to the project root (works across filesystems)
execute_process(
  COMMAND ${CMAKE_COMMAND} -E create_symlink
  ${CMAKE_BINARY_DIR}/compile_commands.json
  ${CMAKE_SOURCE_DIR}/compile_commands.json)

# Location of extra cmake includes for the project
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_files)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/build)

# Version and git hash id
find_package(Git)

# Set version variable
set(SOPT_VERSION 5.0.0)

# If git is found and this is a git workdir, then figure out build id
# Stores results in SOPT_VERSION and SOPT_GITREF
if(GIT_FOUND)
  execute_process(
    COMMAND ${GIT_EXECUTABLE} rev-parse HEAD
    RESULT_VARIABLE HASH_RESULT
    OUTPUT_VARIABLE GIT_HASH
    ERROR_QUIET
  )
  if(HASH_RESULT EQUAL 0)
    string(STRIP "${GIT_HASH}" GIT_HASH)
  else()
    set(GIT_HASH "NA")
  endif()
else()
  set(GIT_HASH "NA")
endif()

set(SOPT_GITREF ${GIT_HASH})


option(tests          "Enable testing"                         on)
option(benchmarks     "Enable benchmarking"                    off)
option(examples       "Enable Examples"                        on)
option(openmp         "Enable OpenMP"                          on)
option(dompi          "Enable MPI"                             on)
option(docs           "Build documentation"                    off)
option(coverage       "Build coverage"                         off)
option(onnxrt         "Enable ONNXruntime interface"           off)

if(NOT CMAKE_BUILD_TYPE)
  message(STATUS "Setting build type to 'Release' as none was specified.")
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build Type" FORCE)
endif()
message(STATUS "Building sopt in ${CMAKE_BUILD_TYPE} mode")

if(tests OR examples)
  enable_testing()
endif()


include(compilations)

# search/install dependencies
include(dependencies)

# sets rpath policy explicitly
if(CMAKE_VERSION VERSION_LESS 3.0)
    set_property(GLOBAL PROPERTY MACOSX_RPATH ON)
else()
    cmake_policy(SET CMP0042 NEW)
endif()

if(SOPT_MPI)
  include(DetectIntegerArchitecture)
  DetectIntegerArchitecture(SOPT)
endif()

if(tests)
  find_package(Catch2)
  include(AddCatchTest)
endif()

if(examples)
  include(AddExample)
endif()

if(benchmarks)
  set(GBenchmark_GIT_TAG "v1.3.0")
  include(AddBenchmark)
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-command-line-argument")

if(tests AND coverage)
  # Enable code coverage.
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage")

	# Build with debugging information to make the output meaningful.
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")

	# Disable optimizations to get the most accurate results.
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0")
endif()

add_subdirectory(cpp)

# Exports all Sopt so other packages can access it
include(export_sopt)

