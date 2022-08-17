include(external.cmake)

set(EXT_VERSION "2.6.0")
set(EXT_URL_HASH "SHA256=5af2d27a134f08f76a361adc97920d13406c0dbf003005ffdf0d65c55783a9ff")

ExternalProject_Add(
  ext_rem
#  PREFIX rem
  DEPENDS ext_re
  UPDATE_DISCONNECTED true
  URL https://github.com/baresip/rem/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CONFIGURE_COMMAND ""
  BUILD_COMMAND make LIBRE_PATH=${EXTERNAL_INSTALL_LOCATION} LIBRE_MK=${EXTERNAL_INSTALL_LOCATION}/share/re/re.mk
  INSTALL_COMMAND make install PREFIX=${EXTERNAL_INSTALL_LOCATION} LIBRE_PATH=${EXTERNAL_INSTALL_LOCATION} LIBRE_MK=${EXTERNAL_INSTALL_LOCATION}/share/re/re.mk
  BUILD_IN_SOURCE true
)

add_dependencies(contrib ext_rem)
