# - Try to find the 're' library
# Options
#  LIBRE_STATIC - Search for static library
# Once done this will define
#  LIBRE_FOUND - System has re
#  LIBRE_INCLUDE_DIRS - The re include directories
#  LIBRE_LIBRARIES - The libraries needed to use re
#  LIBRE_DEFINITIONS - Compiler switches required for using re
#  LIBRE_VERSION - The re version
# Targets
#  libre::libre

set(PKG_CONFIG_USE_CMAKE_PREFIX_PATH 1)

find_package(PkgConfig QUIET REQUIRED)
pkg_check_modules(PC_LIBRE REQUIRED QUIET libre)

find_path(LIBRE_INCLUDE_DIR re/re.h HINTS ${PC_LIBRE_INCLUDEDIR} ${PC_LIBRE_INCLUDE_DIRS})

if(LIBRE_STATIC)
  find_library(LIBRE_LIBRARY NAMES re.a libre.a HINTS ${PC_LIBRE_LIBDIR} ${PC_LIBRE_LIBRARY_DIRS})
else()
  find_library(LIBRE_LIBRARY NAMES re libre HINTS ${PC_LIBRE_LIBDIR} ${PC_LIBRE_LIBRARY_DIRS})
endif()

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBRE_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(LIBRE DEFAULT_MSG LIBRE_LIBRARY LIBRE_INCLUDE_DIR)

mark_as_advanced(LIBRE_INCLUDE_DIR LIBRE_LIBRARY)

set(LIBRE_LIBRARIES ${LIBRE_LIBRARY})
set(LIBRE_INCLUDE_DIRS ${LIBRE_INCLUDE_DIR})
set(LIBRE_DEFINITIONS ${PC_LIBRE_CFLAGS_OTHER})
set(LIBRE_VERSION ${PC_LIBRE_VERSION})
set(LIBRE_LINK_LIBRARIES ${PC_LIBRE_LINK_LIBRARIES})

if(NOT TARGET libre::libre AND LIBRE_FOUND)
  if(LIBRE_STATIC)
    add_library(libre::libre STATIC IMPORTED)
  else()
    add_library(libre::libre SHARED IMPORTED)
  endif()
  set_target_properties(libre::libre PROPERTIES IMPORTED_LOCATION "${LIBRE_LIBRARY}")
  set_target_properties(libre::libre PROPERTIES INTERFACE_COMPILE_OPTIONS "${LIBRE_DEFINITIONS}")
  set_target_properties(libre::libre PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${LIBRE_INCLUDE_DIRS}")
  set_target_properties(libre::libre PROPERTIES INTERFACE_LINK_LIBRARIES "${LIBRE_LINK_LIBRARIES}")
endif()
