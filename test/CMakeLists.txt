cmake_minimum_required(VERSION 3.20)

cmake_policy(SET CMP0135 OLD) # new in cmake 3.24

if(NOT DEFINED CMAKE_BUILD_TYPE OR "${CMAKE_BUILD_TYPE}" STREQUAL "")
  message(STATUS "CMAKE_BUILD_TYPE not set, defaulting to Debug")
  set(CMAKE_BUILD_TYPE Debug)
endif()

project(
  modules-test
  VERSION 1.0.0
  DESCRIPTION "test project for cmake-modules"
  HOMEPAGE_URL "https://github.com/ngruenwald/cmake-modules"
  LANGUAGES C CXX
)

set(PROJECT_KIND application/tool)
set(PROJECT_LICENSE MIT)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../modules)
include(install_paths)
include(library_suffix)
include(embedded_resources)
include(scm_info)
include(packaging)

set(OS_RELEASE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/os-release/alma-8.4")
set(OS_AUTO_GATHER FALSE)
include(os_info)

print_scm_info()
print_os_info(COMPACT)
message(STATUS "Packaging: ${OS_PACKAGE_FORMAT}")


generate_resources(TARGET resources RESOURCES ../README.md ../modules/embedded_resources.cmake)
add_library_suffix(resources VERSIONED)

add_executable(test main.cpp)
target_link_libraries(test PRIVATE resources)
target_include_directories(test PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

# build external projects
add_subdirectory(contrib)
