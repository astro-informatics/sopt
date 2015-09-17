include_directories( 
     ${PYTHON_INCLUDE_DIR}
     ${NUMPY_INCLUDE_DIRS}
     ${CMAKE_CURRENT_SOURCE_DIR}
     ${FFTW3_INCLUDE_DIR}
     ${CFitsIO_INCLUDE_DIR}
     ${TIFF_INCLUDE_DIR}
     ${CMAKE_SOURCE_DIR}/include
     ${CMAKE_SOURCE_DIR}/cpp
     ${EIGEN3_INCLUDE_DIR})
   
   configure_file(${CMAKE_SOURCE_DIR}/cpp/sopt/logging.in.h ${CMAKE_SOURCE_DIR}/include/sopt/logging.h)
   add_python_module(sopt CPP TARGETNAME pysdmm  FAKE_INIT sdmm.pyx)
