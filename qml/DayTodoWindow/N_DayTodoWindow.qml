import QtQuick 2.15

import "../Base"

Item {
    N_DateSelector{
        id: calendar;
        anchors.top: parent.top;
        anchors.left: parent.left;
        implicitHeight: 40;
        implicitWidth: 450;
        color: "#DDDDDD"
        radius: 20;
        z: 100;
    }
    N_AddEvent{
        id: addevent;
        focus: true;
        anchors.left: calendar.right;
        anchors.right: parent.right;
        anchors.top: parent.top;
        anchors.leftMargin: 7;
    }
    Rectangle{
        anchors.top: calendar.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.topMargin: 7;
        radius: 20;
        color: "#DDDDDD";
    }
}
