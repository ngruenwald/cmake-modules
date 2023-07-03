if(NOT DEFINED EXTERNAL_INSTALL_LOCATION OR "${EXTERNAL_INSTALL_LOCATION}" STREQUAL "")
  set(EXTERNAL_INSTALL_LOCATION ${CMAKE_BINARY_DIR}/external)
  list(APPEND CMAKE_PREFIX_PATH ${EXTERNAL_INSTALL_LOCATION})
  set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
endif()

if(NOT DEFINED EXTERNAL_AT_BUILD)
  set(EXTERNAL_AT_BUILD FALSE)
endif()

message(DEBUG "EXTERNAL_INSTALL_LOCATION: ${EXTERNAL_INSTALL_LOCATION}")

if(FALSE)
# remove shared libs
  add_custom_target(
    contrib
    ALL
    COMMAND ${CMAKE_COMMAND} -E rm -f "${EXTERNAL_INSTALL_LOCATION}/lib/*.so" || true
  )
else()
  add_custom_target(contrib ALL)
endif()

include(ext_argparse.cmake)
include(ext_backward.cmake)
include(ext_catch2.cmake)
include(ext_cxxopts.cmake)
include(ext_fmt.cmake)
include(ext_fundus.cmake)
include(ext_httplib.cmake)
include(ext_json.cmake)
include(ext_inja.cmake)
include(ext_libarchive.cmake)
include(ext_libgit2.cmake)
include(ext_lyra.cmake)
#include(ext_nod.cmake)
include(ext_opentelemetry.cmake)
include(ext_pugixml.cmake)
include(ext_re.cmake)
include(ext_spdlog.cmake)
#include(ext_strtk.cmake)
include(ext_tempus.cmake)
include(ext_tink.cmake)
include(ext_toml11.cmake)
include(ext_yaml_cpp.cmake)
include(ext_zlib.cmake)

message(DEBUG "EXTERNAL_PROJECTS: ${EXTERNAL_PROJECTS}")

MakeExternalProjectsAvailable(contrib)
