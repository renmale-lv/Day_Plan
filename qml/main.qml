import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Templates as T

import FramelessWindow

import "SideBar"
import "BottomBar"
import "DayTodoWindow"
import "OverviewWindow"
import "MusicWindow"

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

        onSelectindexChanged: {
            switch(selectindex){
            case 1: myloader.sourceComponent=dayTodoPage; break;
            case 2: myloader.sourceComponent=overviewPage; break;
            case 3: myloader.sourceComponent=musicPage; break;
            }
        }
    }

    //底栏
    N_BottomBar{
        id: bottombar;
        anchors.left: sidebar.right;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.leftMargin: 7;
        anchors.bottomMargin: 7;
        anchors.rightMargin: 7;
    }

    //主体窗口
    Loader{
        id: myloader;
        anchors.top: parent.top;
        anchors.left: sidebar.right;
        anchors.right: parent.right;
        anchors.bottom: bottombar.top;
        anchors.margins: 7;
    }
    Component.onCompleted: myloader.sourceComponent=dayTodoPage;

    Component{
        id: dayTodoPage;
        N_DayTodoWindow{
            anchors.fill: parent;
        }
    }
    Component{
        id: overviewPage;
        N_OverviewWindow{
            anchors.fill: parent;
        }
    }
    Component{
        id: musicPage;
        N_MusicWindow{
            anchors.fill: parent;

        }
    }
}
