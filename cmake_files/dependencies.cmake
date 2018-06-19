include(PackageLookup)  # check for existence, or install external projects

lookup_package(Eigen3 REQUIRED DOWNLOAD_BY_DEFAULT ARGUMENTS URL "http://bitbucket.org/eigen/eigen/get/3.2.tar.gz" MD5 "035ccc791f046f48e90bb1fb42ce227e")
if(logging)
  lookup_package(spdlog REQUIRED)
endif()

if(docs)
  cmake_policy(SET CMP0057 NEW)
  find_package(Doxygen REQUIRED dot)
  if(NOT DOXYGEN_FOUND)
    mesage(STATUS "Could not find Doxygen or dot. No building documentation")
    set(docs OFF)
  endif()
endif()


find_package(TIFF)
if(examples OR regression)
  if(NOT TIFF_FOUND)
    message(FATAL_ERROR "Examples and regressions require TIFF")
  endif()
endif()

if(benchmark)
    lookup_package(GBenchmark REQUIRED DOWNLOAD_BY_DEFAULT ARGUMENTS GIT_TAG "v1.3.0")
endif()

if(regressions)
  find_package(FFTW3 REQUIRED DOUBLE)
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

set(SOPT_MPI FALSE)
if(dompi)
	find_package(MPI)
endif()
set(SOPT_MPI ${MPI_FOUND})
