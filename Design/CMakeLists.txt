cmake_minimum_required(VERSION 3.5)

project(Design)

add_library(Design STATIC
    #侧边栏
    SideBar.hpp SideBar.cpp
)

find_package(Qt5 COMPONENTS Widgets REQUIRED)
target_link_libraries(Design Qt5::Widgets)
