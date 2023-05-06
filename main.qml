import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Templates as T

ApplicationWindow {
    id: mainWindow;
    color: "#2C3333";
    opacity: 1;
    //窗口大小
    width: 1050;
    height: 700;
    minimumWidth: 1050;
    minimumHeight: 700;

    //设置无边框
    flags: Qt.Window | Qt.FramelessWindowHint;
    visible: true;

    //实现鼠标拖动
    MouseArea{
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton;
        property point lastPosition: "0,0";
        //鼠标按下
        onPressed: function(mouse){
            lastPosition=Qt.point(mouse.x,mouse.y);
        }
        //鼠标移动
        onPositionChanged: function(mouse){
            mainWindow.x = mousePosition.cursorPos().x - lastPosition.x;
            mainWindow.y = mousePosition.cursorPos().y - lastPosition.y;
            console.log(mainWindow.x,mainWindow.y);
        }
    }
    ResizeItem{
        anchors.fill: parent
        focus: true
    }

    //侧边栏
    Rectangle{
        id: sideBar;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        anchors.topMargin: 7;
        anchors.bottomMargin: 7;
        anchors.leftMargin: 7;
        width: 200;
        color: "#A5C9CA";
        radius: 20;

        Row{
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.topMargin: 7;
            anchors.leftMargin: 14;
            height: 20;
            spacing: 7;
            T.Button{
                id: quitButton;
                width: 14;
                height: 14;
                background: Rectangle{
                    radius: 7;
                    color: quitButton.hovered ? "#e94d56" : Qt.lighter("#e94d56");
                }
                onClicked: {quitAniamation.start();quitTimer.start();}
                Timer{
                    id: quitTimer;
                    interval: 200;
                    repeat: false;
                    running: false;
                    triggeredOnStart: false;
                    onTriggered: {Qt.quit();}
                }
                NumberAnimation{
                    id: quitAniamation;
                    target: mainWindow;
                    properties: "width";
                    from: mainWindow.width;
                    to: 0;
                    duration: 200;
                }
            }
            T.Button{
                id: miniButton;
                width: 14;
                height: 14;
                background: Rectangle{
                    radius: 7;
                    color: miniButton.hovered ? "#f2bf2f" : Qt.lighter("#f2bf2f");
                }
                onClicked: {
                    if(mainWindow.visibility===Window.Maximized){
                        mainWindow.visibility=Window.Windowed;
                    }else{
                        mainWindow.visibility=Window.Maximized;
                    }
                }
            }
            T.Button{
                id: hideButton;
                width: 14;
                height: 14;
                background: Rectangle{
                    radius: 7;
                    color: hideButton.hovered ? "#2be33f" : Qt.lighter("#2be33f");
                }
                onClicked: {mainWindow.visibility=Window.Minimized;}
            }
        }
    }
}
