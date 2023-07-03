# source: https://github.com/bfgroup/Lyra
# target: bfg::lyra

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "1.6.1")
set(EXT_URL_HASH "SHA256=bc1bba5d4897205484c2f135db825f1189a74520592ee59d4f58b36c58c92f35")

AddExternalProject(
  lyra
  UPDATE_DISCONNECTED true
  URL https://github.com/bfgroup/Lyra/archive/refs/tags/${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
)

add_dependencies(contrib lyra)
