# source: https://github.com/libgit2/libgit2
# target: libgit2

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "1.6.4")
set(EXT_URL_HASH "SHA256=2f1e72eed29918e44113ccd69e166af9b07e5a10ff48927a012381f38dc3e9c2")

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
