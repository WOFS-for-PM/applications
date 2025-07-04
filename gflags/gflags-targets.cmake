# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6...3.18)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget gflags::gflags_shared gflags::gflags_nothreads_shared)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  unset(_targetsDefined)
  unset(_targetsNotDefined)
  unset(_expectedTargets)
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Create imported target gflags::gflags_shared
add_library(gflags::gflags_shared SHARED IMPORTED)

set_target_properties(gflags::gflags_shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "GFLAGS_IS_A_DLL=0"
  INTERFACE_INCLUDE_DIRECTORIES "/usr/local/gflags/include"
  INTERFACE_LINK_LIBRARIES "-lpthread"
)

# Create imported target gflags::gflags_nothreads_shared
add_library(gflags::gflags_nothreads_shared SHARED IMPORTED)

set_target_properties(gflags::gflags_nothreads_shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "GFLAGS_IS_A_DLL=0"
  INTERFACE_INCLUDE_DIRECTORIES "/usr/local/gflags/include"
)

# Import target "gflags::gflags_shared" for configuration "Release"
set_property(TARGET gflags::gflags_shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(gflags::gflags_shared PROPERTIES
  IMPORTED_LOCATION_RELEASE "/usr/local/gflags/lib/libgflags.so.2.2.2"
  IMPORTED_SONAME_RELEASE "libgflags.so.2.2"
  )

# Import target "gflags::gflags_nothreads_shared" for configuration "Release"
set_property(TARGET gflags::gflags_nothreads_shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(gflags::gflags_nothreads_shared PROPERTIES
  IMPORTED_LOCATION_RELEASE "/usr/local/gflags/lib/libgflags_nothreads.so.2.2.2"
  IMPORTED_SONAME_RELEASE "libgflags_nothreads.so.2.2"
  )

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
