import QtQuick
import QtQuick.Templates as T
import "../Base"

Rectangle {

    property date day: new Date(calendar.m_year,calendar.m_month-1,calendar.m_day);

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
                font.family: "华文楷体";
                font.pixelSize: 14;
                anchors.centerIn: parent;
                text: calendar.m_year+"年"+calendar.m_month+"月"+calendar.m_day+"日";
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
    }
}
