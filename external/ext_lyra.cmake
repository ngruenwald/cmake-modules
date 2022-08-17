include(external.cmake)

set(EXT_VERSION "1.6")
set(EXT_URL_HASH "SHA256=e27c6eca98dad626bd17c236aea57cc8ab8e72dea0c66e140d0ce18740ba4d5b")

ExternalProject_Add(
  lyra
  UPDATE_DISCONNECTED true
  URL https://github.com/bfgroup/Lyra/archive/refs/tags/${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
)

add_dependencies(contrib lyra)
