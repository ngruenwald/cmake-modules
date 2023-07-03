# source: https://github.com/ngruenwald/tempus
# target: ng::tempus

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "0.1.1")
set(EXT_URL_HASH "SHA256=dd5193ee84989c6b78bb9607f03910b141299157c93d77a8dbf3592f70a78b52")

AddExternalProject(
  tempus
  UPDATE_DISCONNECTED true
  URL https://github.com/ngruenwald/tempus/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D UNIT_TESTS=OFF
    -D TOOLS=OFF
)

add_dependencies(contrib tempus)
