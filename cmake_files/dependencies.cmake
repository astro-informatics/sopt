include(PackageLookup)  # check for existence, or install external projects


if(docs)
  cmake_policy(SET CMP0057 NEW)
  find_package(Doxygen REQUIRED dot)
  if(NOT DOXYGEN_FOUND)
    mesage(STATUS "Could not find Doxygen or dot. No building documentation")
    set(docs OFF)
  endif()
endif()


find_package(TIFF)
if(examples)
  if(NOT TIFF_FOUND)
    message(FATAL_ERROR "Examples require TIFF")
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
    message(STATUS "Could not find OpenMP. Compiling without.")
    set(SOPT_OPENMP FALSE)
  endif()
endif()

set(SOPT_MPI FALSE)
if(dompi)
  find_package(MPI)
endif()
set(SOPT_MPI ${MPI_FOUND})
