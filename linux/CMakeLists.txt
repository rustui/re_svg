cmake_minimum_required(VERSION 3.10)
set(PROJECT_NAME "re_svg")
project(${PROJECT_NAME} LANGUAGES C)

# Build the thin FFI wrapper from shared src/
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/../src" "${CMAKE_CURRENT_BINARY_DIR}/shared")

# Prebuilt libresvg.so — the actual resvg native library
set(RESVG_PREBUILT "${CMAKE_CURRENT_SOURCE_DIR}/third_party/libresvg.so")

# Tell Flutter to bundle both libraries into the app
set(re_svg_bundled_libraries
  "${RESVG_PREBUILT}"
  "$<TARGET_FILE:re_svg>"
  PARENT_SCOPE
)
