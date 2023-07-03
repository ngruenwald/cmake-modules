# source: https://github.com/jarro2783/cxxopts
# target: cxxopts::cxxopts

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "3.1.1")
set(EXT_URL_HASH "SHA256=25b644a2bfa9c6704d723be51b026bc02420dfdee1277a49bfe5df3f19b0eaa4")

AddExternalProject(
  cxxopts
  UPDATE_DISCONNECTED true
  URL https://github.com/jarro2783/cxxopts/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D CXXOPTS_BUILD_EXAMPLES=OFF
    -D CXXOPTS_BUILD_TESTS=OFF
)

add_dependencies(contrib cxxopts)
