include(external.cmake)

set(EXT_VERSION "2.6")
set(EXT_URL_HASH "SHA256=ce4e58d527b83679bdcc4adfa852af7ec9df16b76c11637823ef642cb02d2618")

ExternalProject_Add(
  ext_argparse
  UPDATE_DISCONNECTED true
  URL https://github.com/p-ranav/argparse/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D ARGPARSE_BUILD_TESTS=OFF
    -D ARGPARSE_LONG_VERSION_ARG_ONLY=OFF
)

add_dependencies(contrib ext_argparse)
