include(external.cmake)

set(EXT_VERSION "0.12.6")
set(EXT_URL_HASH "SHA256=bdeb6be5f30cce0544204ed50bcb9b15ca0f9b360c148cbf75f0664584ac92d9")

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
