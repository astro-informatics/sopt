include_directories(SYSTEM ${PYTHON_INCLUDE_DIR} ${NUMPY_INCLUDE_DIRS})
include_directories("${PROJECT_SOURCE_DIR}/python/")
include_directories("${PROJECT_BINARY_DIR}/python/")
add_python_module(sopt TARGETNAME pysopt
  __init__.py function.pyx function.pxd
  CPP
  LIBRARIES sopt
)
