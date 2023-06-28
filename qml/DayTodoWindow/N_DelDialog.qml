import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Templates as T

Dialog{
    id: root;
    width: 400;
    height: 150;
    closePolicy: Popup.NoAutoClose;
    property int mid;
    property string mtext;

    background: Rectangle{
        anchors.fill: parent;
        radius: 20;
    }

    //弹出后使背景窗口变暗
    dim: true;
    modal: true;
    Overlay.modal: Rectangle{
        color: "#33000000";
        // AA RR GG BB 8位HEX
    }

    T.Button{
        id: closebutton;
        width: 20;
        height: 20;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.margins: 10;
        background: Rectangle{
            anchors.fill: parent;
            color: closebutton.hovered ? "#e94d56" : Qt.lighter("#e94d56");
            radius: 10;
        }
        onClicked: {
            root.reject();
        }
    }

    Text{
        id: title;
        anchors.top: parent.top;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.topMargin: 20;
        text: "是否删除该事件";
        font.family: "华文楷体";
        font.pixelSize: 24;
    }

    Text{
        anchors.top: title.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.topMargin: 20;
        text: mtext;
        font.family: "华文楷体";
        font.pixelSize: 20;
    }

    T.Button{
        id: confirmbutton;
        width: 70;
        height: 30;
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        anchors.margins: 10;
        background: Rectangle{
            anchors.fill: parent;
            radius: 5;
            color: confirmbutton.hovered ? "#ff9090" : "#ffb3b7";
            Text{
                anchors.centerIn: parent;
                text: "确认";
                font.family: "华文楷体";
                font.pixelSize: 18;
            }
        }
        onClicked: {
            root.accept();
        }
    }

    T.Button{
        id: cancelbutton;
        width: 70;
        height: 30;
        anchors.right: confirmbutton.left;
        anchors.bottom: parent.bottom;
        anchors.margins: 10;
        background: Rectangle{
            anchors.fill: parent;
            radius: 5;
            Text{
                anchors.centerIn: parent;
                text: "取消";
                font.family: "华文楷体";
                font.pixelSize: 18;
                color: "#595959";
            }
            color: cancelbutton.hovered ? "#ebeaeb" : "#f5f4f5";
        }
        onClicked: {
            root.reject();
        }
    }
}
