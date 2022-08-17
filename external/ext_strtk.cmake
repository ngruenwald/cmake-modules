include(external.cmake)

set(STRTK_VERSION "master")
set(STRTK_HASH "")

ExternalProject_Add(
  ext_strtk
  UPDATE_DISCONNECTED true
  URL https://github.com/ArashPartow/strtk/archive/${STRTK_VERSION}.zip
  UPDATE_COMMAND ""
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND
    COMMAND ${CMAKE_COMMAND} -E make_directory "${EXTERNAL_INSTALL_LOCATION}"
    COMMAND ${CMAKE_COMMAND} -E copy
      "${CMAKE_CURRENT_BINARY_DIR}/ext_strtk-prefix/src/ext_strtk/strtk.hpp"
      "${EXTERNAL_INSTALL_LOCATION}/include/strtk.hpp"
  TEST_COMMAND ""
)

add_library(strtk::strtk INTERFACE IMPORTED GLOBAL)
set_target_properties(strtk::strtk PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${EXTERNAL_INSTALL_LOCATION}/include")

add_dependencies(contrib ext_strtk)
