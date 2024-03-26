# https://github.com/ngruenwald/cmake-modules
# SPDX-License-Identifier: MIT

# Used variables
#
# LICENSE_FILE, CHANGELOG_FILE, README_FILE
# PACKAGE_VERSIONED (INSTALL_VERSIONED)
# RELEASE_BUILD, BUILD_NUMBER <- ENV
# PROJECT_NAME, PROJECT_VERSION (_MAJOR, _MINOR, _PATCH, _TWEAK, _SCM)
# PROJECT_VENDOR, PROJECT_DESCRIPTION, PROJECT_KIND, PROJECT_LICENSE
#

#
# Helpers
#

function(set_system_name)
  if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/os_info.cmake")
    include(${CMAKE_CURRENT_LIST_DIR}/os_info.cmake)
    get_os_label(PACKAGE_OS_LABEL)
    if(NOT "${PACKAGE_OS_LABEL}" STREQUAL "")
      set(CPACK_SYSTEM_NAME ${PACKAGE_OS_LABEL} PARENT_SCOPE)
    endif()
  endif()
endfunction(set_system_name)

function(find_a_file the_file)
  set(options )
  set(oneValueArgs WARNING)
  set(multiValueArgs FILENAMES EXTENSIONS PATHS)
  cmake_parse_arguments(ARG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  if(NOT ARG_EXTENSIONS)
    set(ARG_EXTENSIONS .md;.txt;" ")
  endif()

  if(NOT ARG_PATHS)
    set(ARG_PATHS ${CMAKE_CURRENT_SOURCE_DIR})
  endif()

  foreach(path in ITEMS ${ARG_PATHS})
    foreach(file IN ITEMS ${ARG_FILENAMES})
      foreach(extension IN ITEMS ${ARG_EXTENSIONS})
        if(EXISTS ${path}/${file}${extension})
          set(${the_file} ${path}/${file}${extension} PARENT_SCOPE)
          return()
        endif()
      endforeach()
    endforeach()
  endforeach()

  if(ARG_WARNING)
    message(WARNING ${ARG_WARNING})
  endif()
endfunction()

#
# Prepare
#

set_system_name()

if(NOT DEFINED LICENSE_FILE)
  find_a_file(
    LICENSE_FILE
    FILENAMES LICENSE License license
    PATHS ${CMAKE_SOURCE_DIR}
    WARNING "no license file found"
  )
endif()

if(NOT DEFINED README_FILE)
  find_a_file(
    README_FILE
    FILENAMES README Readme readme
    PATHS ${CMAKE_SOURCE_DIR}
    WARNING "no readme file found"
  )
endif()

if(NOT DEFINED CHANGELOG_FILE)
  find_a_file(
    CHANGELOG_FILE
    FILENAMES CHANGELOG Changelog changelog
    PATHS ${CMAKE_SOURCE_DIR}
    WARNING "no changelog file found"
  )
endif()

if(NOT DEFINED PACKAGE_VERSIONED AND DEFINED INSTALL_VERSIONED)
  set(PACKAGE_VERSIONED ${INSTALL_VERSIONED})
endif()

if(NOT DEFINED BUILD_NUMBER AND DEFINED ENV{BUILD_NUMBER})
  set(BUILD_NUMBER $ENV{BUILD_NUMBER})
endif()

if(NOT DEFINED RELEASE_BUILD AND (DEFINED ENV{RELEASE_BUILD} OR DEFINED ENV{RELEASE_TAG}))
  set(RELEASE_BUILD TRUE)
endif()

if(NOT DEFINED CPACK_GENERATOR AND DEFINED OS_PACKAGE_FORMAT)
  set(CPACK_GENERATOR ${OS_PACKAGE_FORMAT})
endif()

#
# CPack variables
#

set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
if(RELEASE_BUILD)
  set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
else()
  set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR})
  if(NOT "${PROJECT_VERSION_TWEAK}" STREQUAL "")
    set(CPACK_PACKAGE_VERSION ${CPACK_PACKAGE_VERSION}.${PROJECT_VERSION_PATCH})
  endif()
  if(NOT "${PROJECT_VERSION_SCM}" STREQUAL "")
    set(CPACK_PACKAGE_VERSION ${CPACK_PACKAGE_VERSION}-${PROJECT_VERSION_SCM})
  endif()
endif()
#if(PACKAGE_VERSIONED)
#  set(CPACK_PACKAGE_NAME ${CPACK_PACKAGE_NAME}_${CPACK_PACKAGE_VERSION})
#endif()
set(CPACK_PACKAGE_VENDOR ${PROJECT_VENDOR})
set(CPACK_PACKAGE_DESCRIPTION ${PROJECT_DESCRIPTION})
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY ${PROJECT_DESCRIPTION})
set(CPACK_RESOURCE_FILE_LICENSE ${LICENSE_FILE})
set(CPACK_RESOURCE_FILE_README ${README_FILE})
set(CPACK_STRIP_FILES FALSE)
set(CPACK_PACKAGE_RELOCATABLE TRUE)

if(NOT DEFINED CPACK_PACKAGING_INSTALL_PREFIX)
  if(IS_ABSOLUTE ${CMAKE_INSTALL_PREFIX})
    set(CPACK_PACKAGING_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
  endif()
endif()

#
# RPM variables
#

if(PACKAGE_VERSIONED)
  set(CPACK_RPM_PACKAGE_NAME ${PROJECT_NAME}_${PROJECT_VERSION})
endif()
if(RELEASE_BUILD)
  set(CPACK_RPM_PACKAGE_RELEASE 2)
endif()
if(NOT "${BUILD_NUMBER}" STREQUAL "")
  set(CPACK_RPM_PACKAGE_RELEASE "${CPACK_RPM_PACKAGE_RELEASE}.${BUILD_NUMBER}")
endif()
set(CPACK_RPM_PACKAGE_LICENSE ${PROJECT_LICENSE})
set(CPACK_RPM_PACKAGE_GROUP ${PROJECT_KIND})
set(CPACK_RPM_CHANGELOG_FILE ${CHANGELOG_FILE})
set(CPACK_RPM_PACKAGE_DESCRIPTION "${PROJECT_NAME} ${PROJECT_VERSION}")
if(PROJECT_VERSION_SCM)
  set(CPACK_RPM_PACKAGE_DESCRIPTION "${CPACK_RPM_PACKAGE_DESCRIPTION} (${PROJECT_VERSION_SCM})")
endif()

set(CPACK_RPM_PACKAGE_AUTOREQ 0)
set(CPACK_RPM_SPEC_MORE_DEFINE "%define _build_id_links none")

#
# finally
#

include(CPack)
