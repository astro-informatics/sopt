if(logging)
  add_library(common_catch_main_object OBJECT "common_catch_main.cc")
  if(SPDLOG_INCLUDE_DIR)
    target_include_directories(common_catch_main_object SYSTEM PUBLIC ${SPDLOG_INCLUDE_DIR})
  endif()
  if(CATCH_INCLUDE_DIR)
    target_include_directories(common_catch_main_object SYSTEM PUBLIC ${CATCH_INCLUDE_DIR})
  endif()
  target_include_directories(common_catch_main_object PUBLIC
    "${PROJECT_BINARY_DIR}/include/"
    "${CMAKE_CURRENT_SOURCE_DIR}/.."
  )
  add_dependencies(common_catch_main_object lookup_dependencies)
endif()

add_catch_test(wavelets LIBRARIES sopt)
add_catch_test(sara LIBRARIES sopt)
add_catch_test(maths LIBRARIES sopt)
add_catch_test(wrapper LIBRARIES sopt)
add_catch_test(conjugate_gradient LIBRARIES sopt)
add_catch_test(linear_transform LIBRARIES sopt)
add_catch_test(sdmm LIBRARIES sopt)
add_catch_test(sdmm_warm_start LIBRARIES sopt)
add_catch_test(proximal LIBRARIES sopt)
add_catch_test_with_seed(seeded_proximal test_proximal 1449580491)
add_catch_test(padmm LIBRARIES sopt)
add_catch_test(padmm_warm_start LIBRARIES sopt)
add_catch_test(reweighted LIBRARIES sopt)
add_catch_test(power_method LIBRARIES sopt)
add_catch_test(primal_dual LIBRARIES sopt)

if(dompi)
  add_library(common_mpi_catch_main_object OBJECT common_mpi_catch_main.cc)
  target_include_directories(common_mpi_catch_main_object
    PUBLIC ${PROJECT_SOURCE_DIR}/cpp ${PROJECT_BINARY_DIR}/include ${MPI_CXX_INCLUDE_PATH})

	function(add_mpi_test testname)
		  add_catch_test(${testname} COMMON_MAIN common_mpi_catch_main_object NOTEST ${ARGN})
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
		  	  test_${testname} ${arguments})
		  set_tests_properties(${testname} PROPERTIES LABELS "catch;mpi")
	endfunction()

	add_mpi_test(communicator LIBRARIES sopt)
  add_mpi_test(mpi_proximals LIBRARIES sopt)
  add_mpi_test(serial_vs_parallel_padmm LIBRARIES sopt tools_for_tests)
endif()
