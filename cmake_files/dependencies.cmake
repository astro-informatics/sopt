# On different platforms the CMakeDeps generator in conan seems to install eigen
# as either "eigen" or "Eigen3", so we need to work around this for now.
find_package(eigen NAMES Eigen3)
if(eigen_FOUND OR Eigen3_FOUND)
  if(eigen_INCLUDE_DIR)
    set(EIGEN3_INCLUDE_DIR ${eigen_INCLUDE_DIR} CACHE INTERNAL "")
  elseif(Eigen3_INCLUDE_DIR)
    set(EIGEN3_INCLUDE_DIR ${Eigen3_INCLUDE_DIR} CACHE INTERNAL "")
  endif()
else()
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
  find_package(Doxygen REQUIRED dot)
  if(NOT Doxygen_FOUND)
    message(FATAL_ERROR "Could not find Doxygen or dot")
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

if(onnxrt)
  find_package(onnxruntime REQUIRED)
endif()

if(cppflow)
  find_package(cppflow)
  find_library(TENSORFLOW_LIB tensorflow REQUIRED)
endif()
