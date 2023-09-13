# Exports sopt so other packages can access it
export(TARGETS sopt FILE "${PROJECT_BINARY_DIR}/soptCPPTargets.cmake")

# Avoids creating an entry in the cmake registry.
if(NOT NOEXPORT)
    export(PACKAGE sopt)
endif()

# First in binary dir
set(ALL_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/cpp" "${PROJECT_BINARY_DIR}/include")
configure_File(cmake_files/soptConfig.in.cmake
    "${PROJECT_BINARY_DIR}/soptConfig.cmake" @ONLY
)
configure_File(cmake_files/soptConfigVersion.in.cmake
    "${PROJECT_BINARY_DIR}/soptConfigVersion.cmake" @ONLY
)

# Then for installation tree
file(RELATIVE_PATH REL_INCLUDE_DIR
    "${CMAKE_INSTALL_PREFIX}/share/cmake/sopt"
    "${CMAKE_INSTALL_PREFIX}/include"
)
set(ALL_INCLUDE_DIRS "\${sopt_CMAKE_DIR}/${REL_INCLUDE_DIR}")
configure_file(cmake_files/soptConfig.in.cmake
    "${PROJECT_BINARY_DIR}/CMakeFiles/soptConfig.cmake" @ONLY
)

# Finally install all files
install(FILES
    "${PROJECT_BINARY_DIR}/CMakeFiles/soptConfig.cmake"
    "${PROJECT_BINARY_DIR}/soptConfigVersion.cmake"
    DESTINATION share/cmake/sopt
    COMPONENT dev
)

install(EXPORT soptCPPTargets DESTINATION share/cmake/sopt COMPONENT dev)
