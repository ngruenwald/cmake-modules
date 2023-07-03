# source: https://github.com/bombela/backward-cpp
# target: Backward::Backward or backward

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "1.6")
set(EXT_HASH "SHA256=9b07e12656ab9af8779a84e06865233b9e30fadbb063bf94dd81d318081db8c2")

AddExternalProject(
  backward-cpp
  UPDATE_DISCONNECTED true
  URL https://github.com/bombela/backward-cpp/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
  #  -D BACKWARD_HAS_DW=1
    -D BACKWARD_HAS_BFD=1
  #  -D BACKWARD_HAS_UNWIND=1
)

add_dependencies(contrib backward)
