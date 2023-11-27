# list of headers
set(headers
  bisection_method.h chained_operators.h credible_region.h
  imaging_padmm.h logging.disabled.h
  forward_backward.h imaging_forward_backward.h
  g_proximal.h l1_g_proximal.h joint_map.h
  imaging_primal_dual.h primal_dual.h
  maths.h proximal.h relative_variation.h sdmm.h
  wavelets.h conjugate_gradient.h l1_proximal.h logging.enabled.h padmm.h proximal_expression.h
  reweighted.h types.h wrapper.h exception.h linear_transform.h logging.h positive_quadrant.h
  tv_primal_dual.h gradient_operator.h
  l2_forward_backward.h l2_primal_dual.h
  real_type.h sampling.h power_method.h objective_functions.h ${PROJECT_BINARY_DIR}/include/sopt/config.h
  )
set(wavelet_headers
  wavelets/direct.h wavelets/indirect.h wavelets/innards.impl.h wavelets/sara.h
  wavelets/wavelet_data.h wavelets/wavelets.h
  )

set(sources wavelets/wavelets.cc wavelets/wavelet_data.cc)
if(TIFF_FOUND)
  list(APPEND sources utilities.cc)
  list(APPEND headers utilities.h)
endif()
if(SOPT_MPI)
  list(APPEND sources mpi/communicator.cc mpi/registered_types.cc mpi/session.cc)
  list(APPEND mpi_headers mpi/communicator.h mpi/registered_types.h mpi/utilities.h mpi/session.h)
endif()
if(onnxrt)
  list(APPEND headers ort_session.h)
endif()
if(cppflow)
  list(APPEND sources cppflow_utils.cc)
  list(APPEND headers cppflow_utils.h tf_g_proximal.h)
endif()

add_library(sopt SHARED ${sources})
set(version "${SOPT_VERSION_MAJOR}.${SOPT_VERSION_MINOR}.${SOPT_VERSION_PATCH}")
set(soversion "${SOPT_VERSION_MAJOR}.${SOPT_VERSION_MINOR}")
set_target_properties(sopt PROPERTIES VERSION ${version} SOVERSION ${soversion})

target_include_directories(sopt PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/..>
  $<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/include>
  $<INSTALL_INTERFACE:include/>)

if(NOT SOPT_OPENMP)
  find_package(Threads REQUIRED)
  target_link_libraries(sopt Threads::Threads)
endif()
if(TIFF_FOUND)
  target_link_libraries(sopt TIFF::TIFF)
  target_include_directories(sopt SYSTEM PUBLIC ${TIFF_INCLUDE_DIR})
endif()
# Add spdlog as direct dependency
if(spdlog_FOUND)
  target_link_libraries(sopt spdlog::spdlog)
endif()
if(EIGEN3_INCLUDE_DIR)
  target_include_directories(sopt SYSTEM PUBLIC ${EIGEN3_INCLUDE_DIR})
endif()
if(TARGET openmp::openmp)
  target_link_libraries(sopt openmp::openmp)
endif()
if(SOPT_MPI)
  target_link_libraries(sopt ${MPI_CXX_LIBRARIES})
  target_include_directories(sopt SYSTEM PUBLIC ${MPI_CXX_INCLUDE_PATH})
endif()
if(onnxrt)
  target_link_libraries(sopt ${onnxruntime_LIBRARIES})
  target_include_directories(sopt SYSTEM PUBLIC ${onnxruntime_INCLUDE_DIRS})
endif()
if (cppflow)
  target_link_libraries(sopt "${TENSORFLOW_LIB}")
  # Make cppflow include directory public. Install interface can't point to source directory,
  # so it needs to be separately defined, explained in
  # https://stackoverflow.com/questions/25676277/cmake-target-include-directories-prints-an-error-when-i-try-to-add-the-source
  # Add /usr/local/include for default location of TensorFlow headers
  target_include_directories(sopt PUBLIC
    $<BUILD_INTERFACE:${cppflow_INCLUDE_DIR}>
    $<BUILD_INTERFACE:/usr/local/include>
    $<INSTALL_INTERFACE:cppflow/include/>
    )
endif()


target_link_libraries(sopt ${CONAN_LIBS})

install(FILES ${headers} DESTINATION include/sopt)
install(FILES ${wavelet_headers} DESTINATION include/sopt/wavelets)
install(FILES ${mpi_headers} DESTINATION include/sopt/mpi)
install(TARGETS sopt
  EXPORT soptCPPTargets
  DESTINATION share/cmake/sopt
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  INCLUDES DESTINATION include
)
