import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T

Item {
    property date end
    property date start
    property string text

    height: childrenRect.height

    Row {
        id: time
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        spacing: 4

        T.Button {
            id: starttime
            height: 30
            width: include_time.checked ? parent.width / 2 - 2 : parent.width;

            background: Rectangle {
                anchors.fill: parent
                border.color: "grey"
                border.width: 1
                color: "red"
                radius: 5

                Text {
                    anchors.centerIn: parent
                    font.family: "华文楷体"
                    font.pixelSize: 16
                    text: "111"
                }
            }
            Behavior on width{
                RotationAnimation { duration: 200; }
            }

        }
        T.Button {
            id: endtime
            height: 30
            width: parent.width / 2 - 2

            background: Rectangle {
                anchors.fill: parent
                border.color: "grey"
                border.width: 1
                color: "yellow"
                radius: 5

                Text {
                    anchors.centerIn: parent
                    font.family: "华文楷体"
                    font.pixelSize: 16;
                }
            }

            visible: include_time.checked ? true : false;
            Behavior on width{
                RotationAnimation { duration: 200; }
            }
        }
    }
    Item {
        id: calendar;
        property int selected: 1;

        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.top: time.bottom;
        anchors.topMargin: 4;
        height: 100;

        Rectangle {
            anchors.fill: parent;
            color: "green";
            radius: 10;
        }
    }
    Switch {
        id: include_time;
        anchors.left: parent.left;
        anchors.top: calendar.bottom;
        text: "include time";
        font.family: "华文楷体";
        font.pixelSize: 14;

        indicator: Rectangle {
            implicitWidth: 40;
            implicitHeight: 20;
            x: include_time.leftPadding;
            y: parent.height / 2 - height / 2;
            radius: 10;
            color: include_time.checked ? "#2383e2" : "#dbdad6";
            border.color: include_time.checked ? "#2383e2" : "#dbdad6";

            Rectangle {
                x: include_time.checked ? parent.width - width-2 : 2;
                y: 2;
                width: 16;
                height: 16;
                radius: 8;
                border.width: 0;
                color: "#ffffff";
                Behavior on x{
                    RotationAnimation { duration: 200; }
                }
            }
        }
    }
}
