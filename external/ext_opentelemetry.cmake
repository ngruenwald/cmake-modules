include(external.cmake)

set(EXT_VERSION "1.6.0")
set(EXT_URL_HASH "SHA256=205d70bceeeff570fd3d5e82267c1c39aec0492700cc40ecf0de1b3005aeeecf")

ExternalProject_Add(
  ext_opentelemetry
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

add_dependencies(contrib ext_opentelemetry)
