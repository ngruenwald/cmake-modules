# External Dependencies

Add external projects for static builds.

## Usage

Because we want to use the imported targets in our project, we need to build
the external projects first. Otherwise _find_package & co._  wont find the
projects.

There are two ways to accomplish this. Either do an (initial) build of the
external projects only (Option A), or use the super build pattern (Option B).

### Option A - Explicit

In your main CMakeLists.txt

```
cmake_minimum_required(VERSION 3.20)

project(my-project VERSION 1.0.0 LANGUAGES C CXX)

option(EXTERNAL_ONLY "Build only external dependencies" OFF)

add_subdirectory(contrib) # contains the 'external' files

if(NOT EXTERNAL_ONLY)
  add_subdirectory(source)
endif()

```

```
# mkdir build && cd build
# cmake .. -D EXTERNAL_ONLY=ON
# cmake --build .
# cmake .. -D EXTERNAL_ONLY=OFF
# cmake --build .
```

### Option B - Superbuild

```
cmake_minimum_required(VERSION 3.20)

option(USE_SUPERBUILD "Whether or not a superbuild should be invoked" ON)

if(USE_SUPERBUILD)

  project(SUPERBUILD NONE)

  add_subdirectory(contrib) # contains the 'external' files

  ExternalProject_Add(
    my-project
    DEPENDS contrib
    SOURCE_DIR ${PROJECT_SOURCE_DIR}
    CMAKE_ARGS
        -D USE_SUPERBUILD=OFF
        ${EXTRA_CMAKE_ARGS}
    INSTALL_COMMAND ""
    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}
  )

else()

  project(my-project VERSION 1.0.0 LANGUAGES C CXX)
  add_subdirectory(source)

endif()

```
