include(external.cmake)

set(EXT_VERSION "1.5.0")
set(EXT_URL_HASH "SHA256=997058b57c4f16d3c9753c80a9df842a937e6b503170881312bbb28f9808e20c")

ExternalProject_Add(
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

add_dependencies(contrib libgit2)
