cmake_minimum_required(VERSION 3.16)

project(Noob VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#add_definitions(QT_DEPRECATED_WARNINGS)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick Widgets Core QuickControls2 Gui)

add_subdirectory(Design)

qt_add_executable(Noob
    main.cpp qml.qrc imgs.qrc
)

target_link_libraries(Noob
    PUBLIC Qt6::Quick Qt6::Widgets Qt6::QuickControls2 Qt6::Core Design
)

target_include_directories(Noob
    PUBLIC ./Design)
