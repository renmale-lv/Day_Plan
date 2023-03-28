cmake_minimum_required(VERSION 3.5)

project(Frame)

add_library(Frame STATIC
    widget.hpp widget.cpp
)

find_package(Qt5 COMPONENTS Widgets REQUIRED)
target_link_libraries(Frame Qt5::Widgets)
