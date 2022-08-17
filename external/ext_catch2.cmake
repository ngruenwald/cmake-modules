include(external.cmake)

set(EXT_VERSION "3.1.0")
set(EXT_URL_HASH "SHA256=7219c2ca75a6b2a157b1b162e4ad819fb32585995cac32542a4f72d950dd96f7")

ExternalProject_Add(
  ext_catch2
  UPDATE_DISCONNECTED true
  URL https://github.com/catchorg/Catch2/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D CATCH_INSTALL_DOCS=OFF
    -D CATCH_INSTALL_EXTRAS=OFF
)

add_dependencies(contrib ext_catch2)
