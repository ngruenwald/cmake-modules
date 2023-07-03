# source: https://github.com/fmtlib/fmt
# target: fmt::fmt

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "10.0.0")
set(EXT_URL_HASH "SHA256=5bf4d5358301fdf3bd100c01b9d4c1fbb2091dc2267fb4fa6d7cd522b3e47179")

AddExternalProject(
  fmt
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
