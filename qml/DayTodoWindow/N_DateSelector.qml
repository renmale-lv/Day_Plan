import QtQuick
import QtQuick.Templates as T
import "../Base"

Rectangle {
    B_DateList{
        id: datelist;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        anchors.right: calendar.left;
    }

    T.Button{
        id: calendar;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        width: 120;

        background: Rectangle{
            anchors.fill: parent;
            anchors.margins: 3;
            radius: 17;
            color: "#ffed4a";
            Text{
                anchors.centerIn: parent;
                text: "5月17号";
            }
        }
    }
}
