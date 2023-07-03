# source: https://github.com/madler/zlib
# target: zlibstatic, zlib

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "1.2.13")
set(EXT_URL_HASH "SHA256=c2856951bbf30e30861ace3765595d86ba13f2cf01279d901f6c62258c57f4ff")

AddExternalProject(
  zlib
  UPDATE_DISCONNECTED true
  URL https://github.com/madler/zlib/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D HTTPLIB_COMPILE=ON
    -D HTTPLIB_REQUIRE_OPENSSL=ON
    -D OPENSSL_USE_STATIC_LIBS=ON
    -D OPENSSL_ROOT_DIR=${OPENSSL_ROOT_DIR}
    -D BUILD_SHARED_LIBS=OFF
)

add_dependencies(contrib zlib)
