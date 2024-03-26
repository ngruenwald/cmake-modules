# source: https://github.com/baresip/re
# target: libre::re

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "3.4.0")
set(EXT_URL_HASH "SHA256=1b5c2aae6afe04cb6ca58fde50b6c01bf6d2864fe2dac1c80155d9a4b0497af7")

AddExternalProject(
  re
  UPDATE_DISCONNECTED true
  URL https://github.com/baresip/re/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D USE_REM=ON
    -D USE_BFCP=ON
    -D USE_JBUF=ON
    -D USE_PCP=ON
    -D USE_RTMP=ON
    -D USE_SIP=ON
    -D LIBRE_BUILD_SHARED=OFF
    -D LIBRE_BUILD_STATIC=ON
)
