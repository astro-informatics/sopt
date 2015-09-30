# - Try to find catch framework
find_path(CATCH_INCLUDE_DIR catch.hpp)

set(CATCH_INCLUDE_DIRS ${CATCH_INCLUDE_DIR} )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(Catch  DEFAULT_MSG CATCH_INCLUDE_DIR)
