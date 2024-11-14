get_filename_component(sopt_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
message(STATUS "Linking to sopt package in ${sopt_CMAKE_DIR}")
set(sopt_INCLUDE_DIR "@ALL_INCLUDE_DIRS@")

if (@SOPT_ORT@)
  # try and find ORT from the environment
  find_package(onnxruntime QUIET)
  if(NOT ${onnxruntime_FOUND})
    # if not found, it was installed on the fly
    set(onnxruntime_LIBRARIES onnxruntime::onnxruntime)
    add_library(${onnxruntime_LIBRARIES} SHARED IMPORTED GLOBAL)
    set_target_properties(${onnxruntime_LIBRARIES}
                          PROPERTIES
                          IMPORTED_LOCATION "@onnxruntime_DIR@/lib/libonnxruntime.so"
                          INTERFACE_INCLUDE_DIRECTORIES "@onnxruntime_INCLUDE_DIR@")
  endif()
endif()

if(NOT TARGET libsopt AND EXISTS "${sopt_CMAKE_DIR}/soptCTargets.cmake")
  include("${sopt_CMAKE_DIR}/soptCTargets.cmake")
endif()
if(NOT TARGET sopt AND EXISTS "${sopt_CMAKE_DIR}/soptCPPTargets.cmake")
  include("${sopt_CMAKE_DIR}/soptCPPTargets.cmake")
endif()

unset(sopt_LIBRARIES)
if(TARGET sopt)
  list(APPEND sopt_LIBRARIES sopt)
  set(sopt_CPP_LIBRARY sopt)
endif()
if(TARGET libsopt)
  list(APPEND sopt_LIBRARIES libsopt)
  set(sopt_C_LIBRARY libsopt)
endif()
set(sopt_HAS_MPI @SOPT_MPI@)
set(sopt_HAS_ORT @SOPT_ORT@)
