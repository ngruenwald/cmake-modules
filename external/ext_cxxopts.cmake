include(external.cmake)

set(EXT_VERSION "3.0.0")
set(EXT_URL_HASH "SHA256=1eefdf5af3ba0c66458258de05df2a113262ad5e85cac489de0a456088e9f9b0")

ExternalProject_Add(
  ext_cxxopts
  UPDATE_DISCONNECTED true
  URL https://github.com/jarro2783/cxxopts/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D CXXOPTS_BUILD_EXAMPLES=OFF
    -D CXXOPTS_BUILD_TESTS=OFF
)

add_dependencies(contrib ext_cxxopts)
