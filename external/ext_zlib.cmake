# source: https://github.com/madler/zlib
# target: zlibstatic, zlib

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "1.3")
set(EXT_URL_HASH "SHA256=e6ee0c09dccf864ec23f2df075401cc7c68a67a8a633ff182e7abcb7c673356e")

AddExternalProject(
  zlib
  UPDATE_DISCONNECTED true
  URL https://github.com/madler/zlib/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
)
