# source: https://github.com/zeux/pugixml
# target: pugixml::static, pugixml::shared

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "1.13")
set(EXT_URL_HASH "SHA256=f39095550ed704c2e73e36ff6736278217c00bf22f5fc7511433cea0dfa85459")

AddExternalProject(
  pugixml
  UPDATE_DISCONNECTED true
  URL https://github.com/zeux/pugixml/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D PUGIXML_USE_STATIC_CRT=OFF
)
