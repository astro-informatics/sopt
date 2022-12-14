# list of headers
set(headers
  bisection_method.h chained_operators.h credible_region.h
  imaging_padmm.h logging.disabled.h
  forward_backward.h imaging_forward_backward.h
  g_proximal.h l1_g_proximal.h
  joint_map.h
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
  list(APPEND sources mpi/communicator.cc mpi/registered_types.cc mpi/session.cc wavelets/sara.cc)
  list(APPEND mpi_headers mpi/communicator.h mpi/registered_types.h mpi/utilities.h mpi/session.h)
endif()
if (cppflow)
  list(APPEND sources cppflow_utils.cc)
  list(APPEND headers cppflow_utils.h)
endif()

add_library(sopt SHARED ${sources})
set(version "${Sopt_VERSION_MAJOR}.${Sopt_VERSION_MINOR}.${Sopt_VERSION_PATCH}")
set(soversion "${Sopt_VERSION_MAJOR}.${Sopt_VERSION_MINOR}")
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
  target_include_directories(sopt SYSTEM PUBLIC ${spdlog_INCLUDE_DIR})
endif()
# Add Eigen3 as direct dependency
# On different platforms the CMakeDeps generator in conan seems to install eigen
# as either "eigen" or "Eigen3" because the recipe does not explicitly define the
# name (yet). To work around this we have to check for both.
if(eigen_FOUND)
  target_include_directories(sopt SYSTEM PUBLIC ${eigen_INCLUDE_DIR})
endif()
if(Eigen3_FOUND)
  target_include_directories(sopt SYSTEM PUBLIC ${Eigen3_INCLUDE_DIR})
endif()
if(TARGET openmp::openmp)
  target_link_libraries(sopt openmp::openmp)
endif()
if(SOPT_MPI)
  target_link_libraries(sopt ${MPI_CXX_LIBRARIES})
  target_include_directories(sopt SYSTEM PUBLIC ${MPI_CXX_INCLUDE_PATH})
endif()
if (cppflow)
  target_link_libraries(sopt "${TENSORFLOW_LIB}")
  target_include_directories(sopt PRIVATE cppflow/include/cppflow "${TENSORFLOW_LIB_INCLUDE_DIR}")
endif()


target_link_libraries(sopt ${CONAN_LIBS}) 

install(FILES ${headers} DESTINATION include/sopt)
install(FILES ${wavelet_headers} DESTINATION include/sopt/wavelets)
install(FILES ${mpi_headers} DESTINATION include/sopt/mpi)
install(TARGETS sopt
  EXPORT SoptCPPTargets
  DESTINATION share/cmake/sopt
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  INCLUDES DESTINATION include
  )
