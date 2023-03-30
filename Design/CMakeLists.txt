cmake_minimum_required(VERSION 3.5)

project(Design)

add_library(Design STATIC
    #标题栏
    TitleBar.hpp TitleBar.cpp
    #底栏
    ButtomBar.hpp ButtomBar.cpp

    #自定义小控件
    NewRadioButton.hpp NewRadioButton.cpp
)

find_package(Qt5 COMPONENTS Widgets REQUIRED)
target_link_libraries(Design Qt5::Widgets)
