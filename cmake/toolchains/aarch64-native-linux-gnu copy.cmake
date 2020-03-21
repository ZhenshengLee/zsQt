include(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(CMAKE_CROSSCOMPILING TRUE)

SET (CMAKE_C_COMPILER_WORKS 1)
SET (CMAKE_CXX_COMPILER_WORKS 1)

#不使用动态链接 -rdyamic
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")

# The toolchain prefix for all toolchain executables
set( CROSS_COMPILE aarch64-linux-gnu- )

if (WIN32)
    message(STATUS "Now is windows")
elseif (UNIX)
    message(STATUS "Now is linux")
    set(CROSS_COMPILE_ROOT_PATH "/usr/bin/")
    set(CMAKE_C_COMPILER    ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}gcc)
    set(CMAKE_CXX_COMPILER  ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}g++)
    set(CMAKE_ASM_COMPILER  ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}as)
    set(CMAKE_AR            ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}gcc)
    set(CMAKE_RANLIB        ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}ranlib)
    set(COVERAGE_COMMAND    ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}gcov)
    set(CMAKE_OBJCOPY       ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}objcopy)
    # set(CMAKE_MAKE_PROGRAM  ${CROSS_COMPILE_ROOT_PATH}/bin/make)
endif ()

SET(CMAKE_CXX_FLAGS "-std=c++11 -march=armv8-a -fopenmp ${CMAKE_CXX_FLAGS}" )
set(CMAKE_EXE_LINKER_FLAGS "-Wl,-gc-sections -specs=nosys.specs -static")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_FIND_ROOT_PATH ${CROSS_COMPILE_ROOT_PATH})

# Tell pkgconfig to use aarch64
# SET(ENV{PKG_CONFIG_PATH} "/usr/lib/aarch64-linux-gnu/pkgconfig")
