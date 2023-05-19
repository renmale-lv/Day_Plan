# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Release")
  file(REMOVE_RECURSE
  "CMakeFiles\\appDay_Plan_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appDay_Plan_autogen.dir\\ParseCache.txt"
  "appDay_Plan_autogen"
  )
endif()
