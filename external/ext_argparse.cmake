# source: https://github.com/p-ranav/argparse
# target: argparse::argparse

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "2.9")
set(EXT_URL_HASH "SHA256=55396ae05d9deb8030b8ad9babf096be9c35652d5822d8321021bcabb25f4b72")

AddExternalProject(
  argparse
  UPDATE_DISCONNECTED true
  URL https://github.com/p-ranav/argparse/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D ARGPARSE_BUILD_TESTS=OFF
    -D ARGPARSE_LONG_VERSION_ARG_ONLY=OFF
)
