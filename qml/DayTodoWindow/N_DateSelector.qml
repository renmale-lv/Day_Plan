import QtQuick
import QtQuick.Templates as T
import "../Base"

Rectangle {
    B_DateList{
        id: datelist;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        anchors.right: calendar_button.left;
    }

    T.Button{
        id: calendar_button;
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
        onClicked: {
            calendar.visible=true;
        }
    }

    B_Calendar{
        id: calendar;
        x: parent.width-width;
        y: parent.height+5;
        z: 1000;
    }
}
