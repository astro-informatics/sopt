# Detects whether char, int, etc have their equivalent int intx_t.
function(IsSimilarTo VARIABLE integer)
  if(NOT "${${VARIABLE}}" STREQUAL "")
    return()
  endif()
  list(GET ARGN 0 first_item)
  list(REMOVE_AT ARGN 0)
  set(staticasserts "  std::is_same<${integer}, ${first_item}>::value\n")
  foreach(var ${ARGN})
    set(staticasserts "${staticasserts}  or std::is_same<${integer}, ${var}>::value\n")
  endforeach()

  file(MAKE_DIRECTORY "${PROJECT_BINARY_DIR}/DetectIntegerArchitecture")
  file(WRITE "${PROJECT_BINARY_DIR}/DetectIntegerArchitecture/equiv.cc"
    "#include <cstdint>\n"
    "#include <type_traits>\n"
    "static_assert(\n"
    "${staticasserts},\n"
    "  \"${integer} vs ${first_item};${ARGN}\");\n"
    "int main(int nargs, char **argv) {\n"
    "  return 0;\n"
    "}\n"
  )
  file(WRITE "${PROJECT_BINARY_DIR}/DetectIntegerArchitecture/notequiv.cc"
    "#include <cstdint>\n"
    "#include <type_traits>\n"
    "static_assert(not (\n"
    "${staticasserts}), \n"
    "  \"${integer} vs ${ARGN}\");\n"
    "int main(int nargs, char **argv) {\n"
    "  return 0;\n"
    "}\n"
  )
  try_compile(equiv
    "${PROJECT_BINARY_DIR}/DetectIntegerArchitecture"
    "${PROJECT_BINARY_DIR}/DetectIntegerArchitecture/equiv.cc"
    OUTPUT_VARIABLE equiv_out
  )
  try_compile(notequiv
    "${PROJECT_BINARY_DIR}/DetectIntegerArchitecture"
    "${PROJECT_BINARY_DIR}/DetectIntegerArchitecture/notequiv.cc"
    OUTPUT_VARIABLE notequiv_out
  )
  if(NOT notequiv AND NOT equiv)
    message("${equiv_out}")
    message("${notequiv_out}")
    message(FATAL_ERROR "Could not acertain integer architecture ${integer}")
  elseif(notequiv AND equiv)
    message("${equiv_out}")
    message("${notequiv_out}")
    message(FATAL_ERROR "Could not acertain integer architecture ${integer}")
  elseif(equiv)
    message(STATUS "${integer} is equivalent to one of ${first_item};${ARGN}")
  else()
    message(STATUS "${integer} is not equivalent to any of ${first_item};${ARGN}")
  endif()
  set(${VARIABLE} "${equiv}" PARENT_SCOPE)
endfunction()

function(DetectIntegerArchitecture PREFIX)
  if(${PREFIX}_INTEGER_DETECTED)
    return()
  endif()
  set(integers
    "std::int8_t" "std::int16_t" "std::int32_t" "std::int64_t"
    "std::uint8_t" "std::uint16_t" "std::uint32_t" "std::uint64_t")
  IsSimilarTo(${PREFIX}_char char ${integers})
  IsSimilarTo(${PREFIX}_long long ${integers} int)
  IsSimilarTo(${PREFIX}_unsigned_long "unsigned long" ${integers} "unsigned int")
  set(${PREFIX}_CHAR_ARCH ${${PREFIX}_char}
     CACHE BOOL "Integer equivalence for char")
  set(${PREFIX}_LONG_ARCH ${${PREFIX}_long}
     CACHE BOOL "Integer equivalence for long")
  set(${PREFIX}_ULONG_ARCH ${${PREFIX}_unsigned_long}
     CACHE BOOL "Integer equivalence for unsigned long")
  set(${PREFIX}_INTEGER_DETECTED TRUE
     CACHE BOOL "Whether to check integer architecture")
endfunction()
