import QtQuick
import QtQuick.Controls
import FrameLess
import QtQuick.Templates as T
import QtQuick.Window

import "qrc:/Qml"
import "qrc:/Qml/SideBar"
import "qrc:/Qml/StatusBar"
import "qrc:/Qml/DayTodoPage"

FramelessWindow {
    id: framelessWindow
    minimumHeight: 800
    minimumWidth: 1300
    visible: true
    Item {
        id: title
        anchors{
            top: parent.top;
            right: parent.right;
        }
        height: 35
        width: framelessWindow.width - statusBar.width - sideBar.width

        // 最小化、最大化、关闭按钮
        Row {
            spacing: 7

            anchors {
                bottom: parent.bottom
                right: parent.right
                rightMargin: 10
                top: parent.top
            }
            T.Button {
                id: minButton
                anchors.verticalCenter: parent.verticalCenter
                height: 16
                width: 16
                onClicked: {
                    showMinimized();
                }
                background: Rectangle {
                    color: minButton.hovered ? "#2be33f" : "#86ff93"
                    radius: 8
                }
            }
            T.Button {
                id: maxButton
                anchors.verticalCenter: parent.verticalCenter
                height: 16
                width: 16
                onClicked: {
                    if (isMaximized()) {
                        showNormal();
                    } else {
                        showMaximized();
                    }
                }
                background: Rectangle {
                    color: maxButton.hovered ? "#f2bf2f" : "#ffe69e"
                    radius: 8
                }
            }
            T.Button {
                id: closeButton
                anchors.verticalCenter: parent.verticalCenter
                height: 16
                width: 16
                onClicked: {
                    close();
                }
                background: Rectangle {
                    color: closeButton.hovered ? "#e94d56" : "#ffb3b7"
                    radius: 8
                }
            }
        }

        // Logo
        Row {
            id: logoRow
            spacing: 7
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                top: parent.top
            }
            Image {
                id: logo
                height: 30
                source: "qrc:/Images/Logo.png"
                width: 30

                anchors {
                    verticalCenter: parent.verticalCenter
                }
            }
            Text {
                id: logoText
                text: "Journal"

                font {
                    family: "华文楷体"
                    pixelSize: 18
                }
                anchors {
                    leftMargin: 5
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    }
    J_StatusBar {
        id: statusBar
        anchors {
            left: sideBar.right
            top: parent.top
        }
        Component.onCompleted: {
            menuButtonClicked.connect(moveSideBar);
        }
    }
    J_SideBar {
        id: sideBar
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
    }
    Loader{
        id: contentLoader
        anchors{
            top: title.bottom
            bottom: parent.bottom
            left: sideBar.right
            right: parent.right
        }
    }
    Component{
        id: dayTodoPage
        J_DayTodoPage{
            anchors.fill: parent
        }
    }

    Component.onCompleted : {
        setTitleBar(title);
        contentLoader.sourceComponent = dayTodoPage;
    }
    function moveSideBar() {
        if (sideBar.width == 0) {
            sideBar.show();
        } else {
            sideBar.hide();
        }
    }
}
