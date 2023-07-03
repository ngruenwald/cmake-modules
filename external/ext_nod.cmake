# source: https://github.com/fr00b0/nod
# target:

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "0.5.4")
set(EXT_URL_HASH "SHA256=e5f9880d6bb526b8e538285e62741745e19ebf3655e2959d206e724c80c69e32")

ExternalProject_Add(
  ext_nod
  UPDATE_DISCONNECTED true
  URL https://github.com/fr00b0/nod/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND
    COMMAND ${CMAKE_COMMAND} -E make_directory "${EXTERNAL_INSTALL_LOCATION}/nod"
    COMMAND ${CMAKE_COMMAND} -E copy
      "${CMAKE_CURRENT_BINARY_DIR}/ext_nod-prefix/src/ext_nod/include/nod/nod.hpp"
      "${EXTERNAL_INSTALL_LOCATION}/include/nod/nod.hpp"
)

add_library(nod::nod INTERFACE IMPORTED GLOBAL)
set_target_properties(nod::nod PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${EXTERNAL_INSTALL_LOCATION}/include")

add_dependencies(contrib ext_nod)
