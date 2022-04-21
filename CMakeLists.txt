cmake_minimum_required(VERSION 3.0)
project(Sopt CXX)

# Location of extra cmake includes for the project
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_files)
# Downloads and installs GreatCMakeCookOff
# It contains a number of cmake recipes
include(LookUp-GreatCMakeCookOff)

# Version and git hash id
include(VersionAndGitRef) #GCMO: scripts/VersionAndGitRef.cmake
# The next two functions are from VersionAndGitRef
# Sets SOPT_VERSION 
set_version(3.1.0) 
# Sets SOPT_GITREF. These don't seem to be used anywhere.
get_gitref()

option(tests          "Enable testing"                         on)
option(benchmarks     "Enable benchmarking"                    off)
option(examples       "Enable Examples"                        on)
option(logging        "Enable logging"                         on)
option(regressions    "Enable regressions"                     off)
option(openmp         "Enable OpenMP"                          on)
option(dompi          "Enable MPI"                             on)
option(docs           "Build documentation"                    off)
option(coverage       "Build coverage"                         off)

# This seems relatively clear from the message
if(NOT CMAKE_BUILD_TYPE)
  message(STATUS "Setting build type to 'Release' as none was specified.")
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build Type" FORCE)
endif()
message(STATUS "Building sopt in ${CMAKE_BUILD_TYPE} mode")

# Add c++11 stuff
# TODO: Is there a standard way of doing this in modern CMake?
include(AddCPP11Flags) #GCMCO: scripts/AddCPP11Flags.cmake
include(CheckCXX11Features) #GCMCO: scripts/CheckCXX11Features.cmake
cxx11_feature_check(REQUIRED unique_ptr nullptr override constructor_delegate)

# The name is not very clear. This tries to compile a tiny program and stores
# the result in SOPT_HAS_USING. This gets used in cpp/sopt/config.in.h.
include(compilations)

# search/install dependencies
# I think we can get rid of this and move the few relevant parts out. See comments within.
include(dependencies)

# Conan setup
include(${PROJECT_SOURCE_DIR}/build/conanbuildinfo.cmake)
conan_basic_setup(KEEP_RPATHS)

# sets rpath policy explicitly
# https://cmake.org/cmake/help/v3.0/policy/CMP0042.html
# TODO: Since conan manages rpaths we may not need this.
if(CMAKE_VERSION VERSION_LESS 3.0)
    set_property(GLOBAL PROPERTY MACOSX_RPATH ON)
else()
    cmake_policy(SET CMP0042 NEW)
endif()

if(SOPT_MPI)
  include(DetectIntegerArchitecture)
  # This detects and defines some data types: SOPT_CHAR_ARCH, SOPT_LONG_ARCH, SOPT_ULONG_ARCH
  # and SOPT_INTEGER_DETECTED.
  # SOPT_INTEGER_DETECTED is never used. The others are in cpp/sopt/mpi/registered_types.*
  DetectIntegerArchitecture(SOPT) #cmake_files
endif()

# Hopefully we can get rid of this
if(NOT SOPT_OPENMP)
  set(CMAKE_THREAD_LIBS_INIT "-lpthread")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
endif()

if(tests OR examples)
  # https://cmake.org/cmake/help/latest/command/enable_testing.html
  enable_testing()
endif()

if(tests)
  # TODO: Look into how to do this in modern cmake.
  # https://cliutils.gitlab.io/modern-cmake/chapters/testing/catch.html
  include(AddCatchTest) #GCMCO: scripts/AddCatchTest.cmake
endif()

if(examples)
  # TODO: Find out what this does / is it obsolete
  include(AddExample) #cmake_files
endif()

if(benchmarks)
  set(GBenchmark_GIT_TAG "v1.3.0")
  # TODO: Can we simplify? Look at https://iboxshare.com/akanmuratcimen/cmake-cpp-boilerplate
  include(AddBenchmark) #GCMCO
endif()

# This can be removed #275
if(regressions)
  include(AddRegression)
endif()

# TODO: This could be done in conanfile.py
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
