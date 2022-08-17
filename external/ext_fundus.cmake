include(external.cmake)

ExternalProject_Add(
  ext_fundus
  UPDATE_DISCONNECTED true
  URL https://github.com/ngruenwald/fundus/archive/refs/heads/main.zip
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  BUILD_IN_SOURCE TRUE
  INSTALL_COMMAND
    COMMAND ${CMAKE_COMMAND} -E make_directory ${EXTERNAL_INSTALL_LOCATION}/include/fundus
    COMMAND ${CMAKE_COMMAND} -E copy_directory
      ${CMAKE_CURRENT_BINARY_DIR}/ext_fundus-prefix/src/ext_fundus
      ${EXTERNAL_INSTALL_LOCATION}/include/fundus
)

add_library(fundus::fundus INTERFACE IMPORTED GLOBAL)
set_target_properties(fundus::fundus PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${EXTERNAL_INSTALL_LOCATION}/include/fundus)

add_dependencies(contrib ext_fundus)
