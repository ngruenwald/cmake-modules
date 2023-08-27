# source: https://github.com/tink-crypto/tink-cc
# target: tink::static

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "2.0.0")
set(EXT_URL_HASH "SHA256=103ddfce800e77f3b3b6b2c808a8611bc734b31ddb12fbcfd8bebc1b96a7e963")

AddExternalProject(
  tink_core_cc
  UPDATE_DISCONNECTED true
  URL https://github.com/tink-crypto/tink-cc/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D TINK_BUILD_TESTS=OFF
#    -D TINK_USE_SYSTEM_OPENSSL=OFF
#    -D TINK_USE_INSTALLED_ABSEIL=OFF
#    -D TINK_USE_INSTALLED_GOOGLETEST=OFF
#    -D USE_ONLY_FIPS=OFF
)
