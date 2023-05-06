import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Templates as T
import FramelessWindow
import "SideBar"

FramelessWindow {
    id: mainWindow;
    color: "#2C3333";
    //窗口大小
    width: 1050;
    height: 700;
    minimumWidth: 1050;
    minimumHeight: 700;
    visible: true;

    //侧边栏
    N_SideBar{
        id: sidebar;
        anchors.left: parent.left;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.topMargin: 7;
        anchors.leftMargin: 7;
        anchors.bottomMargin: 7;
        width: 200;
        mainWindow: mainWindow;
    }
}
