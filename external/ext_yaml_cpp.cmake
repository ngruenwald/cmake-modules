# source: https://github.com/jbeder/yaml-cpp
# target: yaml-cpp::yaml-cpp

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "0.8.0")
set(EXT_URL_HASH "SHA256=334e80ab7b52e14c23f94e041c74bab0742f2281aad55f66be2f19f4b7747071")

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
