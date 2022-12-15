# On different platforms the CMakeDeps generator in conan seems to install eigen
# as either "eigen" or "Eigen3" because the recipe does not explicitly define the
# name (yet). To work around this we have to check for both.
find_package(eigen)
find_package(Eigen3)
if(NOT (eigen_FOUND OR Eigen3_FOUND))
  message(FATAL_ERROR "Eigen is required")
endif()

find_package(TIFF)
if(NOT TIFF_FOUND)
  message(FATAL_ERROR "TIFF is required")
endif()

if(logging)
  find_package(spdlog)
  if(NOT spdlog_FOUND)
    message(FATAL_ERROR "logging requires spdlog")
  endif()
endif()

if(docs)
  cmake_policy(SET CMP0057 NEW)
  find_package(doxygen REQUIRED dot)
  if(NOT doxygen_FOUND)
    mesage(FATAL_ERROR "Could not find Doxygen or dot")
  endif()
endif()

if(openmp)
  find_package(OpenMP)
  if(OPENMP_FOUND)
    set(SOPT_DEFAULT_OPENMP_THREADS 2 CACHE STRING "Number of threads used in testing")
    set(SOPT_OPENMP TRUE)
    add_library(openmp::openmp INTERFACE IMPORTED GLOBAL)
    set_target_properties(openmp::openmp PROPERTIES
      INTERFACE_COMPILE_OPTIONS "${OpenMP_CXX_FLAGS}"
      INTERFACE_LINK_LIBRARIES  "${OpenMP_CXX_FLAGS}")
  else()
    message(FATAL_ERROR "OpenMP was requested but could not be found")
  endif()
endif()

set(SOPT_MPI FALSE)
if(dompi)
  find_package(MPI)
  if(NOT MPI_FOUND)
    message(FATAL_ERROR "MPI was requested but could not be found")
  endif()
endif()
set(SOPT_MPI ${MPI_FOUND})

if(cppflow)
  find_library(TENSORFLOW_LIB tensorflow REQUIRED)
  message("=================== ${TENSORFLOW_LIB}")
endif()
