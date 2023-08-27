# source: https://github.com/gabime/spdlog
# target: spdlog::spdlog
# depends: nlohmann_json, fmt

#
# DEPENDENCIES: ext_fmt
#

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "1.12.0")
set(EXT_URL_HASH "SHA256=6174bf8885287422a6c6a0312eb8a30e8d22bcfcee7c48a6d02d1835d7769232")

AddExternalProjectDependency(fmt)

AddExternalProject(
  spdlog
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
)
