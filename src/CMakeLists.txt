# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(re_svg_library VERSION 0.0.1 LANGUAGES C)

add_library(re_svg SHARED
  "re_svg.c"
)

set_target_properties(re_svg PROPERTIES
  PUBLIC_HEADER re_svg.h
  OUTPUT_NAME "re_svg"
)

target_compile_definitions(re_svg PUBLIC DART_SHARED_LIB)
