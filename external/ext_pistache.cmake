# source: https://github.com/pistacheio/pistache
# target: pistache_static

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "fe5639a81a4392a7b8ab22c29a3d5c761e8e98d6") # commit
set(EXT_URL_HASH "")

AddExternalProject(
  pistache
  UPDATE_DISCONNECTED true
  URL https://github.com/pistacheio/pistache/archive/${EXT_VERSION}.zip
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D BUILD_SHARED_LIBS=OFF
    -D PISTACHE_BUILD_TESTS=OFF
    -D PISTACHE_USE_SSL=ON
)
