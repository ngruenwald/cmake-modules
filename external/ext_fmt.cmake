include(external.cmake)

set(EXT_VERSION "9.0.0")
set(EXT_URL_HASH "SHA256=01867bffc0b30ac71d5f05854e62e451367fa1aceddef40cae965338a7e00a74")

ExternalProject_Add(
  ext_fmt
  UPDATE_DISCONNECTED true
  URL https://github.com/fmtlib/fmt/archive/refs/tags/${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D FMT_INSTALL=ON
    -D FMT_DOC=OFF
    -D FMT_TEST=OFF
)

add_dependencies(contrib ext_fmt)
