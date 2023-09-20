cmake_minimum_required(VERSION 3.16)

project(Design)

add_library(Design STATIC
        framelesswindow.hpp framelesswindow.cpp)

target_link_libraries(Design PUBLIC Qt6::Quick Qt6::Widgets Qt6::Core)
