
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
  set(ORT_TARNAME "onnxruntime-linux-${ARCH}-${ORT_VERSION}")
  set(ORT_DEST "${CMAKE_CURRENT_BINARY_DIR}/external/${ORT_TARNAME}.tgz")
  set(ORT_URL "${ORT_URL_BASE}/v${ORT_VERSION}/${ORT_TARNAME}.tgz")
  # https://cmake.org/cmake/help/latest/policy/CMP0135.html
  #
  # CMP0135 is for solving re-building and re-downloading.
  # The NEW policy suppresses warnings for some CMake versions.
  if(POLICY CMP0135)
    cmake_policy(SET CMP0135 NEW)
  endif()
  set(onnxruntime_DIR "${CMAKE_INSTALL_PREFIX}/external")
  file(DOWNLOAD ${ORT_URL} ${ORT_DEST}
       EXPECTED_HASH SHA256=b072f989d6315ac0e22dcb4771b083c5156d974a3496ac3504c77f4062eb248e
  )
  execute_process(COMMAND ${CMAKE_COMMAND} -E tar xzf ${ORT_DEST})
  execute_process(COMMAND ${CMAKE_COMMAND} -E copy_directory ${ORT_TARNAME} ${onnxruntime_DIR})
  set(onnxruntime_INCLUDE_DIR "${onnxruntime_DIR}/include")
  set(onnxruntime_LIBRARY_DIR "${onnxruntime_DIR}/lib")
  set(onnxruntime_LIBRARIES onnxruntime)
  add_library(${onnxruntime_LIBRARIES} SHARED IMPORTED GLOBAL)
  set_target_properties(${onnxruntime_LIBRARIES} PROPERTIES IMPORTED_LOCATION ${onnxruntime_LIBRARY_DIR}/libonnxruntime.so)
  message(STATUS "ORT-INCDIR=${onnxruntime_INCLUDE_DIR}")
  message(STATUS "ORT-LIBDIR=${onnxruntime_LIBRARY_DIR}")
  message(STATUS "ORT-LIB=${onnxruntime_LIBRARIES}")
  set(onnxruntime_FOUND TRUE)
endif()

