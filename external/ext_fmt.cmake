# source: https://github.com/fmtlib/fmt
# target: fmt::fmt

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "10.1.0")
set(EXT_URL_HASH "SHA256=c1fd1b6e1bc695a47454b8402f08f269489715aaed6dd49744a7ed5a6b9e7487")

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
