
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

  include(FetchContent)
  FetchContent_Declare(onnxruntime URL ${ORT_URL} URL_HASH SHA256=b072f989d6315ac0e22dcb4771b083c5156d974a3496ac3504c77f4062eb248e)
  FetchContent_MakeAvailable(onnxruntime)
  message(STATUS "Downloaded ONNXrt to ${onnxruntime_SOURCE_DIR}")
  set(onnxruntime_INCLUDE_DIR "${onnxruntime_SOURCE_DIR}/include")
  find_library(onnxruntime_LIBRARY
               NAMES onnxruntime
               PATHS ${onnxruntime_SOURCE_DIR}/lib
                     ${onnxruntime_SOURCE_DIR}/lib64)
  add_library(onnxruntime::onnxruntime SHARED IMPORTED)
  set_target_properties(onnxruntime::onnxruntime PROPERTIES
                        IMPORTED_LOCATION "${onnxruntime_LIBRARY}"
                        INTERFACE_INCLUDE_DIRECTORIES "${onnxruntime_INCLUDE_DIR}"
                        LINKER_LANGUAGE CXX)
  set(onnxruntime_FOUND TRUE)
endif()

