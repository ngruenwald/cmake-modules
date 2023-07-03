# source: https://github.com/ngruenwald/fundus
# target: fundus::fundus

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

AddExternalProject(
  fundus
  UPDATE_DISCONNECTED true
  URL https://github.com/ngruenwald/fundus/archive/refs/heads/main.zip
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
)

add_dependencies(contrib fundus)
