# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_ROBOT_PROJECT_VERSION_02_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED ROBOT_PROJECT_VERSION_02_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(ROBOT_PROJECT_VERSION_02_FOUND FALSE)
  elseif(NOT ROBOT_PROJECT_VERSION_02_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(ROBOT_PROJECT_VERSION_02_FOUND FALSE)
  endif()
  return()
endif()
set(_ROBOT_PROJECT_VERSION_02_CONFIG_INCLUDED TRUE)

# output package information
if(NOT ROBOT_PROJECT_VERSION_02_FIND_QUIETLY)
  message(STATUS "Found ROBOT_PROJECT_VERSION_02: 0.0.0 (${ROBOT_PROJECT_VERSION_02_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'ROBOT_PROJECT_VERSION_02' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${ROBOT_PROJECT_VERSION_02_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(ROBOT_PROJECT_VERSION_02_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${ROBOT_PROJECT_VERSION_02_DIR}/${_extra}")
endforeach()
