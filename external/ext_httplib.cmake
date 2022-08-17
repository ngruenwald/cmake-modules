include(external.cmake)

set(EXT_VERSION "0.11.1")
set(EXT_URL_HASH "SHA256=260284115d9ffa41e3505a3b6642a09a42af2c6b72dd4e232a1c6354db107190")

if(WIN32)
  set(OPENSSL_ARGS "-D OPENSSL_USE_STATIC_LIBS=ON -D OPENSSL_ROOT_DIR=${OPENSSL_ROOT_DIR}")
else()
  set(OPENSSL_ARGS "")
endif()

ExternalProject_Add(
  ext_httplib
  UPDATE_DISCONNECTED true
  URL https://github.com/yhirose/cpp-httplib/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D HTTPLIB_COMPILE=ON
    -D HTTPLIB_REQUIRE_OPENSSL=ON ${OPENSSL_ARGS}
    -D BUILD_SHARED_LIBS=OFF
)

add_dependencies(contrib ext_httplib)
