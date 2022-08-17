cmake_minimum_required(VERSION 3.20)

cmake_policy(SET CMP0135 OLD) # new in cmake 3.24

if(NOT DEFINED CMAKE_BUILD_TYPE OR "${CMAKE_BUILD_TYPE}" STREQUAL "")
  message(STATUS "CMAKE_BUILD_TYPE not set, defaulting to Debug")
  set(CMAKE_BUILD_TYPE Debug)
endif()

project(modules-test VERSION 1.0.0 LANGUAGES C CXX)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../modules)
include(install_paths)
include(library_suffix)
include(embedded_resources)

generate_resources(TARGET resources RESOURCES ../README.md ../modules/embedded_resources.cmake)
add_library_suffix(resources VERSIONED)

add_executable(test main.cpp)
target_link_libraries(test PRIVATE resources)
target_include_directories(test PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

# build external projects
add_subdirectory(contrib)
