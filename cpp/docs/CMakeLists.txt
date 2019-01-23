# Set some Doxygen flags
set(SOPT_DOXY_PROJECT_NAME "SOPT")
set(SOPT_DOXY_PROJECT_BRIEF "Sparse OPTimisation")
set(SOPT_DOXY_INPUT "${PROJECT_SOURCE_DIR}/cpp")

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in
  ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
)

add_custom_target(doc ALL
  COMMAND doxygen
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

if (web)
   add_custom_target(docweb
     COMMAND sed -i -e 's@namespacesopt@http://astro-informatics.github.io/sopt/&@g' -e 's@<filename>@&http://astro-informatics.github.io/sopt/@g' ${CMAKE_CURRENT_BINARY_DIR}/html/sopt.tag
     DEPENDS doc)
endif()
