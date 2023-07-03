# source: https://github.com/pantor/inja
# target: pantor::inja
# depends: fmt nlohmann_json

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "3.4.0")
set(EXT_URL_HASH "SHA256=4ad04d380b8377874c7a097a662c1f67f40da5fb7d3abc3851544f59c3613a20")

AddExternalProjectDependency(fmt nlohmann_json)

AddExternalProject(
  inja
  UPDATE_DISCONNECTED true
  URL https://github.com/pantor/inja/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  PATCH_COMMAND
    patch < ${CMAKE_CURRENT_LIST_DIR}/inja_no_export.patch
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D INJA_USE_EMBEDDED_JSON=OFF
    -D INJA_INSTALL=OFF
    -D INJA_EXPORT=OFF
    -D BUILD_TESTING=OFF
    -D INJA_BUILD_TESTS=OFF
    -D BUILD_BENCHMARK=OFF
)
