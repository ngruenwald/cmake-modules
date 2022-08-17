# - Try to find the 'rem' library
# Options
#  LIBREM_STATIC - Search for static library
# Once done this will define
#  LIBREM_FOUND - System has re
#  LIBREM_INCLUDE_DIRS - The re include directories
#  LIBREM_LIBRARIES - The libraries needed to use re
#  LIBREM_DEFINITIONS - Compiler switches required for using re
#  LIBREM_VERSION - The re version
# Targets
#  librem::librem

set(PKG_CONFIG_USE_CMAKE_PREFIX_PATH 1)

find_package(PkgConfig QUIET REQUIRED)
pkg_check_modules(PC_LIBREM REQUIRED QUIET librem)

find_path(LIBREM_INCLUDE_DIR rem/rem.h HINTS ${PC_LIBREM_INCLUDEDIR} ${PC_LIBREM_INCLUDE_DIRS})

if(LIBREM_STATIC)
  find_library(LIBREM_LIBRARY NAMES rem.a librem.a HINTS ${PC_LIBREM_LIBDIR} ${PC_LIBREM_LIBRARY_DIRS})
else()
  find_library(LIBREM_LIBRARY NAMES rem librem HINTS ${PC_LIBREM_LIBDIR} ${PC_LIBREM_LIBRARY_DIRS})
endif()

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBREM_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(LIBREM DEFAULT_MSG LIBREM_LIBRARY LIBREM_INCLUDE_DIR)

mark_as_advanced(LIBREM_INCLUDE_DIR LIBREM_LIBRARY)

set(LIBREM_LIBRARIES ${LIBREM_LIBRARY})
set(LIBREM_INCLUDE_DIRS ${LIBREM_INCLUDE_DIR})
set(LIBREM_DEFINITIONS ${PC_LIBREM_CFLAGS_OTHER})
set(LIBREM_VERSION ${PC_LIBREM_VERSION})
set(LIBREM_LINK_LIBRARIES ${PC_LIBREM_LINK_LIBRARIES})

if(NOT TARGET librem::librem AND LIBREM_FOUND)
  if(LIBREM_STATIC)
    add_library(librem::librem STATIC IMPORTED)
  else()
    add_library(librem::librem SHARED IMPORTED)
  endif()
  set_target_properties(librem::librem PROPERTIES IMPORTED_LOCATION "${LIBREM_LIBRARY}")
  set_target_properties(librem::librem PROPERTIES INTERFACE_COMPILE_OPTIONS "${LIBREM_DEFINITIONS}")
  set_target_properties(librem::librem PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${LIBREM_INCLUDE_DIRS}")
  set_target_properties(librem::librem PROPERTIES INTERFACE_LINK_LIBRARIES "${LIBREM_LINK_LIBRARIES}")
endif()
