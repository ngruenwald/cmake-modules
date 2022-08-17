#
# DEPENDENCIES: ext_json
#

include(external.cmake)

set(EXT_VERSION "3.3.0")
set(EXT_URL_HASH "SHA256=a95e95ff39961be429d564689d265a2eb2f269cb180bb0028c842a7484916cb6")

ExternalProject_Add(
  ext_inja
  UPDATE_DISCONNECTED true
  URL https://github.com/pantor/inja/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D INJA_USE_EMBEDDED_JSON=OFF
    -D INJA_INSTALL=ON
    -D INJA_EXPORT=OFF
    -D BUILD_TESTING=OFF
    -D INJA_BUILD_TESTS=OFF
    -D BUILD_BENCHMARK=OFF
  DEPENDS ext_json
)

add_dependencies(contrib ext_inja)
