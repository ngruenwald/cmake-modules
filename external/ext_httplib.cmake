# source: https://github.com/yhirose/cpp-httplib
# target: httplib::httplib

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "0.14.0")
set(EXT_URL_HASH "SHA256=80cf0227582baaf9d635951defcdd0d97e384909849625ae6ed6477f74990554")

if(WIN32)
  set(OPENSSL_ARGS -D OPENSSL_USE_STATIC_LIBS=ON -D OPENSSL_ROOT_DIR=${OPENSSL_ROOT_DIR})
else()
  set(OPENSSL_ARGS "")
endif()

AddExternalProject(
  httplib
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
