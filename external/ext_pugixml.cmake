include(external.cmake)

set(EXT_VERSION "1.12.1")
set(EXT_URL_HASH "SHA256=3b535bb2f2bddd7edbcc2467ffc085edb652cc1c9462444ec8cc2849bb2e73fb")

ExternalProject_Add(
  ext_pugixml
  UPDATE_DISCONNECTED true
  URL https://github.com/zeux/pugixml/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D PUGIXML_USE_STATIC_CRT=OFF
)

add_dependencies(contrib ext_pugixml)
