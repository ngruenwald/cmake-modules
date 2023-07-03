# source: https://github.com/jbeder/yaml-cpp
# target: yaml-cpp::yaml-cpp

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "0.7.0")
set(EXT_URL_HASH "SHA256=4d5e664a7fb2d7445fc548cc8c0e1aa7b1a496540eb382d137e2cc263e6d3ef5")

AddExternalProject(
  yaml-cpp
  UPDATE_DISCONNECTED true
  URL https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D YAML_BUILD_SHARED_LIBS=OFF
    -D YAML_CPP_BUILD_TESTS=OFF
)

add_dependencies(contrib yaml-cpp)
