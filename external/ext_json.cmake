# source: https://github.com/nlohmann/json
# target: nlohmann_json::nlohmann_json

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "3.11.2")
set(EXT_URL_HASH "SHA256=95651d7d1fcf2e5c3163c3d37df6d6b3e9e5027299e6bd050d157322ceda9ac9")

AddExternalProject(
  nlohmann_json
  UPDATE_DISCONNECTED true
  URL https://github.com/nlohmann/json/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D JSON_BuildTests=OFF
    -D JSON_MultipleHeaders=OFF
  OVERRIDE_FIND_PACKAGE
)

add_dependencies(contrib nlohmann_json)
