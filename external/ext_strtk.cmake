# source: https://github.com/ArashPartow/strtk
# target:

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "master")
set(ET_URL_HASH "")

AddExternalProject(
  ext_strtk
  UPDATE_DISCONNECTED true
  URL https://github.com/ArashPartow/strtk/archive/${EXT_VERSION}.zip
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

#add_library(strtk::strtk INTERFACE IMPORTED GLOBAL)
#set_target_properties(strtk::strtk PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${EXTERNAL_INSTALL_LOCATION}/include")
