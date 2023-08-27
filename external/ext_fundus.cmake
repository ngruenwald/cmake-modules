# source: https://github.com/ngruenwald/fundus
# target: fundus::fundus

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "main")
set(ET_URL_HASH "")

AddExternalProject(
  fundus
  UPDATE_DISCONNECTED true
  URL https://github.com/ngruenwald/fundus/archive/refs/heads/${EXT_VERSION}.zip
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D UNIT_TESTS=OFF
)
