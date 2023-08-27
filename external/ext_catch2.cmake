# source: https://github.com/catchorg/Catch2
# target: Catch2::Catch2WithMain, Catch2::Catch2

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "3.4.0")
set(EXT_URL_HASH "SHA256=cd175f5b7e62c29558d4c17d2b94325ee0ab6d0bf1a4b3d61bc8dbcc688ea3c2")

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
