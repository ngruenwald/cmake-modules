#
# DEPENDENCIES: ext_fmt
#

include(external.cmake)

set(EXT_VERSION "1.10.0")
set(EXT_URL_HASH "SHA256=7be28ff05d32a8a11cfba94381e820dd2842835f7f319f843993101bcab44b66")

ExternalProject_Add(
  ext_spdlog
  UPDATE_DISCONNECTED true
  URL https://github.com/gabime/spdlog/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D SPDLOG_BUILD_EXAMPLE=OFF
    -D SPDLOG_INSTALL=ON
    -D SPDLOG_FMT_EXTERNAL=ON
    -D SPDLOG_CLOCK_COARSE=OFF
  DEPENDS ext_fmt
)

add_dependencies(contrib ext_spdlog)
