
find_package(onnxruntime QUIET)
if(NOT ${onnxruntime_FOUND})
  message(STATUS "ONNXrt not found. Attempt to install...")
  EXECUTE_PROCESS( COMMAND uname -m COMMAND tr -d '\n' OUTPUT_VARIABLE ARCH )
  message( STATUS "Detected architecture: ${ARCH}" )
  if ("${ARCH}" STREQUAL "x86_64")
    set(ARCH "x64")
  endif()
  set(ORT_VERSION "1.16.3")
  set(ORT_URL_BASE "https://github.com/microsoft/onnxruntime/releases/download")
  set(ORT_URL "${ORT_URL_BASE}/v${ORT_VERSION}/onnxruntime-linux-${ARCH}-${ORT_VERSION}.tgz")
  message(STATUS "ORT_URL=${ORT_URL}")

  include(FetchContent)
  # https://cmake.org/cmake/help/latest/policy/CMP0135.html
  #
  # CMP0135 is for solving re-building and re-downloading.
  # The NEW policy suppresses warnings for some CMake versions.
  if(POLICY CMP0135)
    cmake_policy(SET CMP0135 NEW)
  endif()
  FetchContent_Declare(onnxruntime
                       URL ${ORT_URL}
                       URL_HASH SHA256=b072f989d6315ac0e22dcb4771b083c5156d974a3496ac3504c77f4062eb248e
                       DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/external)
  FetchContent_MakeAvailable(onnxruntime)
  message(STATUS "Downloaded ONNXrt to ${CMAKE_CURRENT_BINARY_DIR}/external")
  set(onnxruntime_DIR "${CMAKE_CURRENT_BINARY_DIR}/external")
  set(onnxruntime_INCLUDE_DIR "${onnxruntime_DIR}/include")
  find_library(onnxruntime_LIBRARY
               NAMES onnxruntime
               PATHS ${onnxruntime_DIR}/lib
                     ${onnxruntime_DIR}/lib64)
  add_library(onnxruntime::onnxruntime SHARED IMPORTED)
  set_target_properties(onnxruntime::onnxruntime PROPERTIES
                        IMPORTED_LOCATION "${onnxruntime_LIBRARY}"
                        INTERFACE_INCLUDE_DIRECTORIES "${onnxruntime_INCLUDE_DIR}"
                        LINKER_LANGUAGE CXX)

  #include(ExternalProject)
  #set(onnxruntime_DIR "${CMAKE_INSTALL_PREFIX}/external")
  #ExternalProject_Add(
  #  Lookup-ONNXrt
  #  URL ${ORT_URL}
  #  URL_HASH SHA256=b072f989d6315ac0e22dcb4771b083c5156d974a3496ac3504c77f4062eb248e
  #  PREFIX "${CMAKE_BINARY_DIR}/external"
  #  #INSTALL_DIR ${EXTERNAL_ROOT}
  #  CMAKE_ARGS
  #  -DCMAKE_INSTALL_PREFIX=${onnxruntime_DIR}
  #  -DCMAKE_INSTALL_LIBDIR=${CMAKE_SHARED_LIBRARY_PREFIX}
  #  # Wrap download, configure and build steps in a script to log output
  #  UPDATE_COMMAND ""
  #  LOG_DOWNLOAD ON
  #  LOG_CONFIGURE ON
  #  LOG_BUILD ON
  #  LOG_INSTALL ON
  #)
  set(onnxruntime_FOUND TRUE)
endif()

