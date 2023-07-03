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

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../modules)
include(install_paths)
include(library_suffix)
include(embedded_resources)
include(scm_info)
include(packaging)

set(OS_RELEASE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/os-release/debian-12.0")
set(OS_AUTO_GATHER TRUE)
include(os_info)

print_scm_info()
print_os_info(COMPACT)
message(STATUS "Packaging: ${OS_PACKAGE_FORMAT}")

# build external projects
add_subdirectory(contrib EXCLUDE_FROM_ALL)

if(EXTERNAL_ONLY)
  return()
endif()

generate_resources(TARGET resources RESOURCES ../README.md ../modules/embedded_resources.cmake)
add_library_suffix(resources VERSIONED)

add_executable(test main.cpp)
target_link_libraries(test PRIVATE resources)
target_include_directories(test PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

find_package(OpenSSL REQUIRED)
target_link_libraries(test PRIVATE OpenSSL::SSL OpenSSL::Crypto)

target_link_libraries(test PRIVATE argparse::argparse)
target_link_libraries(test PRIVATE backward)
target_link_libraries(test PRIVATE Catch2::Catch2)
target_link_libraries(test PRIVATE fundus::fundus)
target_link_libraries(test PRIVATE cxxopts::cxxopts)
target_link_libraries(test PRIVATE fmt::fmt)
target_link_libraries(test PRIVATE httplib::httplib)
target_link_libraries(test PRIVATE nlohmann_json::nlohmann_json)
target_link_libraries(test PRIVATE pantor::inja)
target_link_libraries(test PRIVATE archive_static)
#target_link_libraries(test PRIVATE libgit2)
target_link_libraries(test PRIVATE bfg::lyra)
target_link_libraries(test PRIVATE opentelemetry_trace opentelemetry_exporter_ostream_span)
target_link_libraries(test PRIVATE libre::re)
target_link_libraries(test PRIVATE pugixml::static)
target_link_libraries(test PRIVATE spdlog::spdlog)
target_link_libraries(test PRIVATE ng::tempus)
target_link_libraries(test PRIVATE tink::static)
target_link_libraries(test PRIVATE toml11::toml11)
target_link_libraries(test PRIVATE yaml-cpp::yaml-cpp)
target_link_libraries(test PRIVATE zlibstatic)

# FIXME: re does not set include directory
get_target_property(resrc libre::re SOURCE_DIR)
target_include_directories(test PRIVATE ${resrc}/include)