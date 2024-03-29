add_library(common_catch_main_object OBJECT "common_catch_main.cc")
if(spdlog_FOUND)
  target_link_libraries(common_catch_main_object spdlog::spdlog)
endif()
if(Catch2_FOUND)
  target_link_libraries(common_catch_main_object Catch2::Catch2)
endif()
if(EIGEN3_INCLUDE_DIR)
  target_include_directories(common_catch_main_object SYSTEM PUBLIC ${EIGEN3_INCLUDE_DIR})
endif()
if(onnxruntime_INCLUDE_DIR)
  target_include_directories(common_catch_main_object SYSTEM PUBLIC ${onnxruntime_INCLUDE_DIR})
endif()
target_include_directories(common_catch_main_object PUBLIC
  "${EXTERNAL_ROOT}/include/"
  "${PROJECT_BINARY_DIR}/include/"
  "${CMAKE_CURRENT_SOURCE_DIR}/.."
  )
if(CATCH_HAS_THROWS_AS)
  add_definitions(-DCATCH_HAS_THROWS_AS)
endif()

set(RAND_SEED "1449580491")

add_catch_test(bisection_method LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(chained_operators LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(conjugate_gradient LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(credible_region LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(forward_backward LIBRARIES sopt tools_for_tests SEED ${RAND_SEED})
add_catch_test(gradient_operator LIBRARIES sopt tools_for_tests SEED ${RAND_SEED})
add_catch_test(inpainting LIBRARIES sopt tools_for_tests SEED ${RAND_SEED})
add_catch_test(linear_transform LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(maths LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(padmm LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(padmm_warm_start LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(power_method LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(primal_dual LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(proximal LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(reweighted LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(sara LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(sdmm LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(sdmm_warm_start LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(wavelets LIBRARIES sopt SEED ${RAND_SEED})
add_catch_test(wrapper LIBRARIES sopt SEED ${RAND_SEED})

if(onnxrt)
  add_catch_test(ort_model LIBRARIES sopt onnxruntime::onnxruntime)
endif()

if(cppflow)
  add_catch_test(cppflow_model LIBRARIES sopt tools_for_tests)
  add_catch_test(tf_inpainting LIBRARIES sopt tools_for_tests SEED ${RAND_SEED})
endif()

if(SOPT_MPI)
  add_library(common_mpi_catch_main_object OBJECT common_mpi_catch_main.cc)
  target_include_directories(common_mpi_catch_main_object
    PUBLIC ${PROJECT_SOURCE_DIR}/cpp ${PROJECT_BINARY_DIR}/include ${MPI_CXX_INCLUDE_PATH})
  if(spdlog_FOUND)
    target_link_libraries(common_mpi_catch_main_object spdlog::spdlog)
  endif()
  if(Catch2_FOUND)
    target_link_libraries(common_mpi_catch_main_object Catch2::Catch2)
  endif()
  if(EIGEN3_INCLUDE_DIR)
    target_include_directories(common_mpi_catch_main_object SYSTEM PUBLIC ${EIGEN3_INCLUDE_DIR})
  endif()

  function(add_mpi_test_from_test testname)
    unset(arguments)
    if(CATCH_JUNIT)
      set(arguments -r junit -o ${PROJECT_BINARY_DIR}/Testing/${testname}.xml)
    endif()
    if(NOT MPIEXEC_MAX_NUMPROCS)
      set(MPIEXEC_MAX_NUMPROCS 4)
    endif()
    add_test(NAME ${testname}
      COMMAND
      ${MPIEXEC} ${MPIEXEC_NUMPROC_FLAG} ${MPIEXEC_MAX_NUMPROCS} ${MPIEXEC_PREFLAGS}
      $<TARGET_FILE:test_${testname}> ${arguments})
    set_tests_properties(${testname} PROPERTIES LABELS "catch;mpi")
  endfunction()

  function(add_mpi_test testname)
    add_catch_test(${testname} COMMON_MAIN common_mpi_catch_main_object NOTEST ${ARGN})
    add_mpi_test_from_test(${testname})
  endfunction()

  add_mpi_test(communicator LIBRARIES sopt)
  add_mpi_test(mpi_proximals LIBRARIES sopt)
  add_mpi_test(serial_vs_parallel_padmm LIBRARIES sopt tools_for_tests)
  add_mpi_test(mpi_wavelets LIBRARIES sopt)

  add_catch_test(mpi_session NOMAIN LIBRARIES sopt NOTEST)
  add_mpi_test_from_test(mpi_session)
endif()
