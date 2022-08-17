include(external.cmake)

set(EXT_VERSION "3.7.1")
set(EXT_URL_HASH "SHA256=4124577f989d6a558229ef8f06944ca210e4cf1fe72975eaa2528f1a53f129c4")

ExternalProject_Add(
  ext_toml11
  UPDATE_DISCONNECTED true
  URL https://github.com/ToruNiina/toml11/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D toml11_BUILD_TESTS=OFF
)

add_dependencies(contrib ext_toml11)
