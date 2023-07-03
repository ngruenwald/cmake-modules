# source: https://github.com/catchorg/Catch2
# target: Catch2::Catch2WithMain, Catch2::Catch2

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "3.3.2")
set(EXT_URL_HASH "SHA256=802a1d7f98f8e38a7913b596c5e3356ea76c544acb7c695bfd394544556359f3")

AddExternalProject(
  Catch2
  UPDATE_DISCONNECTED true
  URL https://github.com/catchorg/Catch2/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D CATCH_INSTALL_DOCS=OFF
    -D CATCH_INSTALL_EXTRAS=OFF
)
