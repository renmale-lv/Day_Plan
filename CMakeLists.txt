cmake_minimum_required(VERSION 3.16)

project(Day_Plan VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 COMPONENTS QuickControls2 REQUIRED)


set(ALL_SOURCE)
set(ALL_HEAD)
file(GLOB ALL_SOURCE ./src/*.cpp)
file(GLOB ALL_HEAD ./src/*.hpp)

qt_add_executable(appDay_Plan
    ${ALL_SOURCE}
    ${ALL_HEAD}
    readme.md
    qml.qrc
)

set_target_properties(appDay_Plan PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appDay_Plan
    PRIVATE Qt6::Quick Qt6::QuickControls2)

install(TARGETS appDay_Plan
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
include(CPack)
