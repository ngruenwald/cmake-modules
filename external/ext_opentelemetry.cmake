# source: https://github.com/open-telemetry/opentelemetry-cpp
# target:

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "1.9.1")
set(EXT_URL_HASH "SHA256=c61f4c6f820b04b920f35f84a3867cd44138bac4da21d21fbc00645c97e2051e")

AddExternalProject(
  opentelemetry_api
  UPDATE_DISCONNECTED true
  URL https://github.com/open-telemetry/opentelemetry-cpp/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    -D BUILD_SHARED_LIBS=OFF
    -D WITH_STL=ON
    -D WITH_OTLP=ON
    -D WITH_OTLP_GRPC=ON
    -D WITH_METRICS_PREVIEW=ON
    -D WITH_PROMETHEUS=OFF
    -D WITH_EXAMPLES=OFF
    -D BUILD_TESTING=OFF
)
