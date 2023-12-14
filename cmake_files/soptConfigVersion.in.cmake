set(PACKAGE_VERSION "@SOPT_VERSION@")
set(MPI_COMPONENT @SOPT_MPI@)
if("${PACKAGE_VERSION}" VERSION_LESS "${PACKAGE_FIND_VERSION}")
    set(PACKAGE_VERSION_COMPATIBLE FALSE)
else()
    set(PACKAGE_VERSION_COMPATIBLE TRUE)
    if("${PACKAGE_VERSION}" VERSION_EQUAL "${PACKAGE_FIND_VERSION}")
        set(PACKAGE_VERSION_EXACT FALSE)
    endif()
endif()
if(sopt_FIND_REQUIRED_MPI AND NOT MPI_COMPONENT)
  set(PACKAGE_VERSION_COMPATIBLE FALSE)
endif()