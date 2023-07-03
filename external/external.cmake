if(NOT DEFINED EXTERNAL_INSTALL_LOCATION)
  message(FATAL_ERROR "EXTERNAL_INSTALL_LOCATION not set")
endif()

if(NOT DEFINED EXTERNAL_AT_BUILD)
  message(FATAL_ERROR "EXTERNAL_AT_BUILD not set")
endif()

# if(EXTERNAL_AT_BUILD EQUAL TRUE)
#   message(DEBUG "Using ExternalProject")

#   include(ExternalProject)

#   macro(AddExternalProject)
#     ExternalProject_Add(${ARGV})
#   endmacro()

# else()
  message(DEBUG "Using FetchContent")

  include(FetchContent)

  macro(AddExternalProjectDependency)
    foreach(arg IN LISTS ARGN)
      if(NOT ${arg} IN_LIST EXTERNAL_PROJECTS)
        list(APPEND EXTERNAL_PROJECTS ${arg})
      endif()
    endforeach()
  endmacro()

  macro(AddExternalProject)
    FetchContent_Declare(${ARGV})
    # FetchContent_MakeAvailable(${ARGV0})
    if(NOT ${ARGV0} IN_LIST EXTERNAL_PROJECTS)
      list(APPEND EXTERNAL_PROJECTS ${ARGV0})
    endif()
  endmacro()

  macro(MakeExternalProjectsAvailable)
    FetchContent_MakeAvailable(${EXTERNAL_PROJECTS})

    if(NOT "${ARGV0}" STREQUAL "")
      add_dependencies(${ARGV0} ${EXTERNAL_PROJECTS})
    endif()
  endmacro()
#endif()