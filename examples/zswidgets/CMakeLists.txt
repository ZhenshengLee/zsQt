set(APP_NAME zswidgets)

# add_project_meta(META_FILES_TO_INCLUDE)
# find includes in the corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# your source files
set(SOURCE_FILES
    ${APP_NAME}.cpp
    widget.cpp
    widget.ui
)
# name of the .exe file, window flag and the list of things to compile
add_executable(${APP_NAME} ${OS_BUNDLE} ${SOURCE_FILES})

# also tell CMake to link with the libraries from the line 14
# otherwise it'll think that you wanted to find those just for fun and won't link them
target_link_libraries( ${APP_NAME}
    Qt5::Widgets
)

# qt5_use_modules(${PROJECT_NAME} Widgets)
