include(external.cmake)

set(EXT_VERSION "2.6.1")
set(EXT_URL_HASH "SHA256=7738e8944485d57b1e729a30ed58e239a8cb5b380b596fd0e21ed79c69e52fd5")

ExternalProject_Add(
  ext_re
#  PREFIX re
  UPDATE_DISCONNECTED true
  URL https://github.com/baresip/re/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CONFIGURE_COMMAND ""
  BUILD_COMMAND make
  INSTALL_COMMAND make install PREFIX=${EXTERNAL_INSTALL_LOCATION}
  BUILD_IN_SOURCE true
)

add_dependencies(contrib ext_re)
