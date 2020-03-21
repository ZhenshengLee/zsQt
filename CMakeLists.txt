cmake_minimum_required(VERSION 3.10)
cmake_policy(SET CMP0048 NEW)
project("zsqt")

# 调试的时候用Debug
# set(CMAKE_BUILD_TYPE "Debug")
# 出库的时候改成Release
# set(CMAKE_BUILD_TYPE "Release")
# Add this repository's cmake modules to CMAKE_MODULE_PATH
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_LIST_DIR}/cmake)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)

# Include Qt basic functions
# include(QtCommon)

# run moc automatically
set(CMAKE_AUTOMOC ON)
# if you're using Widgets and editing .ui forms in Designer
# if you are using qt quick, set to off
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON) # Resource files

message("Looking for Qt...")
# Qt modules (https://doc.qt.io/qt-5/qtmodules.html) you're using in your application
# if you are using qt quick, you need Quick and Qml
find_package(Qt5 REQUIRED
    Widgets
    Quick
    Qml
)

if (${Qt5_FOUND})
    message("Found Qt " ${Qt5_VERSION})
else()
    message("Couldn't find Qt")
endif()

message("zs: the CMAKE_CURRENT_BINARY_DIR = " ${CMAKE_CURRENT_BINARY_DIR})
message("zs: the CMAKE_RUNTIME_OUTPUT_DIRECTORY = " ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
message("zs: the CMAKE_LIBRARY_OUTPUT_DIRECTORY = " ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
message("zs: the CMAKE_INSTALL_PREFIX = " ${CMAKE_INSTALL_PREFIX})

# variables
set(TARGET_ARCH ${CMAKE_SYSTEM_PROCESSOR})
set(PROJ_DIR ${CMAKE_CURRENT_LIST_DIR})
set(INCLUDE_DIR ${PROJ_DIR}/include)
set(ZSQ_INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR}/include)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_STANDARD 99)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)
# Before CMake 3.14 setting CMAKE_POSITION_INDEPENDENT_CODE did not set the
# "-pie" flag for GCC or Clang
if("${CMAKE_VERSION}" VERSION_LESS "3.14.0")
    if ("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang" OR "${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pie")
    endif()
endif()

include(ZSQCompilerFlags)

add_subdirectory(examples)

