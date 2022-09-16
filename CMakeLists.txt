cmake_minimum_required(VERSION 3.0)
project(Sopt CXX)

# Location of extra cmake includes for the project
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_files)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/build)
# Downloads and installs GreatCMakeCookOff
# It contains a number of cmake recipes
include(LookUp-GreatCMakeCookOff)

# Version and git hash id
include(VersionAndGitRef)
set_version(3.1.0)
get_gitref()

option(tests          "Enable testing"                         on)
option(benchmarks     "Enable benchmarking"                    off)
option(examples       "Enable Examples"                        on)
option(logging        "Enable logging"                         on)
option(openmp         "Enable OpenMP"                          on)
option(dompi          "Enable MPI"                             on)
option(docs           "Build documentation"                    off)
option(coverage       "Build coverage"                         off)

if(NOT CMAKE_BUILD_TYPE)
  message(STATUS "Setting build type to 'Release' as none was specified.")
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build Type" FORCE)
endif()
message(STATUS "Building sopt in ${CMAKE_BUILD_TYPE} mode")

# Add c++11 stuff
include(AddCPP11Flags)
include(CheckCXX11Features)
cxx11_feature_check(REQUIRED unique_ptr nullptr override constructor_delegate)
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

if(tests OR examples)
  enable_testing()
endif()

if(tests)
  find_package(Catch)
  include(AddCatchTest)
endif()
if(examples)
  include(AddExample)
endif()

if(benchmarks)
  set(GBenchmark_GIT_TAG "v1.3.0")
  include(AddBenchmark)
endif()

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
