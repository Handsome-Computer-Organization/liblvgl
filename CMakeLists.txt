#
# Copyright (C) 2020-2021 HandsomeMod Project
#


cmake_minimum_required(VERSION 3.10)
project(lvgl)
set(CMAKE_C_STANDARD 11)#C11
set(CMAKE_CXX_STANDARD 17)#C17
set(CMAKE_CXX_STANDARD_REQUIRED ON)

INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR})

file(GLOB_RECURSE INCLUDES "lv_libs/*.h" "lv_drivers/*.h" "lvgl/*.h" "lv_examples/*.h" "./*.h" )
file(GLOB_RECURSE SOURCES  "lv_libs/*.c" "lv_drivers/*.c" "lvgl/*.c"  "lv_examples/*.c")
# main for test
file(GLOB_RECURSE EXAMPLE  "./main.c" "lv_extra/*.c")
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin) 
SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

find_package(SDL2 REQUIRED SDL2)
find_package(Freetype REQUIRED Freetype)
find_package(rlottie REQUIRED rlottie)
include_directories(${SDL2_INCLUDE_DIRS} ${FREETYPE_INCLUDE_DIRS})
add_library(liblvgl SHARED ${SOURCES} ${INCLUDES})
#main for test
add_executable(main ${EXAMPLE} ${INCLUDES})
target_link_libraries(main PRIVATE rlottie SDL2 freetype liblvgl m)
add_custom_target (run COMMAND ${EXECUTABLE_OUTPUT_PATH}/main)
