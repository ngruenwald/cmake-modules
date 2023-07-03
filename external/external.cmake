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

  macro(AddExternalProject)
    FetchContent_Declare(${ARGV})
    FetchContent_MakeAvailable(${ARGV0})
  endmacro()
#endif()