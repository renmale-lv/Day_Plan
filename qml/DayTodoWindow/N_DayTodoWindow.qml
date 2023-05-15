import QtQuick 2.15

import "../Base"

Item {
    Rectangle{
        id: calendar;
        anchors.top: parent.top;
        anchors.left: parent.left;
        implicitHeight: 40;
        implicitWidth: 500;
        color: "#DDDDDD"
        radius: 20;
        Text{
            anchors.fill: parent;
            text: "DayTodo";
            verticalAlignment: Qt.AlignVCenter;
            horizontalAlignment: Qt.AlignHCenter;
        }
    }
    Rectangle{
        anchors.left: calendar.right;
        anchors.right: parent.right;
        anchors.top: parent.top;
        anchors.leftMargin: 7;
        implicitHeight: 40;
        radius: 20;
        color: "#DDDDDD";
    }
    Rectangle{
        anchors.top: calendar.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.topMargin: 7;
        radius: 20;
        color: "#DDDDDD";

        B_Calendar{
            x:100;
            y:20;
        }
    }
}
