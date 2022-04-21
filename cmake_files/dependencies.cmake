# GCMCO: ./scripts/PackageLookup.cmake
# Can be removed once regressions is gone
include(PackageLookup)  # check for existence, or install external projects


if(docs)
  # Looks important, https://cmake.org/cmake/help/latest/policy/CMP0057.html
  cmake_policy(SET CMP0057 NEW)
  # Find_package can be removed with conan
  find_package(Doxygen REQUIRED dot)
  if(NOT DOXYGEN_FOUND)
    mesage(STATUS "Could not find Doxygen or dot. No building documentation")
    set(docs OFF)
  endif()
endif()

# Can be removed with conan
find_package(TIFF)
if(examples OR regression)
  if(NOT TIFF_FOUND)
    message(FATAL_ERROR "Examples and regressions require TIFF")
  endif()
endif()


# Can be removed per issue #275
if(regressions)
  set(REGRESSION_ORACLE_ID "last_of_c"
    CACHE STRING "Commmit/tag/branch againts which to run regressions")

  lookup_package(Sopt
    REQUIRED DOWNLOAD_BY_DEFAULT
    PATHS "${EXTERNAL_ROOT}"
    NO_DEFAULT_PATH
    ARGUMENTS
      GIT_REPOSITORY "https://www.github.com/basp-group/sopt.git"
      GIT_TAG ${REGRESSION_ORACLE_ID}
      BUILD_TYPE Release
  )
endif()

# TODO: Rewrite according to https://cliutils.gitlab.io/modern-cmake/chapters/packages/OpenMP.html
if(openmp)
  find_package(OpenMP)
  if(OPENMP_FOUND)
    set(SOPT_DEFAULT_OPENMP_THREADS 4 CACHE STRING "Number of threads used in testing")
    set(SOPT_OPENMP TRUE)
    add_library(openmp::openmp INTERFACE IMPORTED GLOBAL)
    set_target_properties(openmp::openmp PROPERTIES
      INTERFACE_COMPILE_OPTIONS "${OpenMP_CXX_FLAGS}"
      INTERFACE_LINK_LIBRARIES  "${OpenMP_CXX_FLAGS}")
  else()
    message(STATUS "Could not find OpenMP. Compiling without.")
    set(SOPT_OPENMP FALSE)
  endif()
endif()

# Seems unnecessary
set(SOPT_MPI FALSE)

# Keep this in some form. See https://cliutils.gitlab.io/modern-cmake/chapters/packages/MPI.html
if(dompi)
  find_package(MPI)
endif()
set(SOPT_MPI ${MPI_FOUND})
