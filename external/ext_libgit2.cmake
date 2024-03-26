# source: https://github.com/libgit2/libgit2
# target: libgit2

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "1.7.1")
set(EXT_URL_HASH "SHA256=f2d5622f538da8218c12f7d42aa66f44a5075965b52852579e4de75192cec215")

AddExternalProject(
  libgit2
  UPDATE_DISCONNECTED true
  URL https://github.com/libgit2/libgit2/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D BUILD_SHARED_LIBS=OFF
    -D BUILD_TESTS=OFF
    -D USE_THREADS=ON
)
