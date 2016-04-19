include_directories(SYSTEM ${PYTHON_INCLUDE_DIR} ${NUMPY_INCLUDE_DIRS})
include_directories(
    "${PROJECT_SOURCE_DIR}/python/"
    "${PROJECT_BINARY_DIR}/python/"
    "${PROJECT_SOURCE_DIR}/cpp/"
)
add_pytest(test_*.py INSTALL PREFIX "sopt")
add_pytest(functions.pyx test_cython CPP LIBRARIES sopt INSTALL PREFIX "sopt" FAKE_INIT)
