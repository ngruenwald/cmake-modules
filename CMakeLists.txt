cmake_minimum_required(VERSION 3.20)

add_custom_target(cmake_modules)

set_target_properties(
  cmake_modules
  PROPERTIES
    MODULES_PATH  "${CMAKE_CURRENT_LIST_DIR}/modules"
    PREFIX_PATH   "${CMAKE_CURRENT_LIST_DIR}/find"
    EXTERNAL_PATH "${CMAKE_CURRENT_LIST_DIR}/externals"
)
