import QtQuick 2.15

import "../Base"

import SqlServer

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
        anchors.right: event_detail.left;
        anchors.bottom: parent.bottom;
        anchors.topMargin: 7;
        anchors.rightMargin: event_detail.visible ? 7 : 0;
        radius: 20;
        color: "#DDDDDD";

        ListView{
            id: event_list;
            anchors.fill: parent;
            anchors.margins: 10;
            spacing: 10;
            clip: true;
            model: sql.get_daytodo_event(calendar.day);


            delegate: Rectangle{
                anchors.left: parent.left;
                anchors.right: parent.right;
                height: childrenRect.height;
                radius: 10;
                color: "pink";
                property var modeldata: event_list.model[index];
                Text {
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    height: 30;
                    width: 300;
                    anchors.topMargin: 10;
                    anchors.leftMargin: 10;
                    anchors.bottomMargin: 10;
                    font.pixelSize: 16;
                    font.family: "华文楷体";
                    text: modeldata.m_name;
                }
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        event_detail.visible=true;
                        event_detail.index=index;
                    }
                }
            }
        }
    }
    Rectangle{
        id: event_detail;
        anchors.right: parent.right;
        anchors.top: calendar.bottom;
        anchors.bottom: parent.bottom;
        width: visible ? parent.width/5*2 : 0;
        radius: 20;
        anchors.topMargin: 7;
        visible: false;

        property int index;
        property var event: sql.get_daytodo_event_byid(index+1);

        MouseArea{
            anchors.fill: parent;
            onClicked: {
                parent.visible=false;
            }
        }

        Behavior on width {
            NumberAnimation{duration: 200;}
        }

        Text{
            id: event_text;
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.margins: 15;
            font.family: "华文楷体";
            font.pixelSize: 24;
            height: 30;
            text: parent.event.m_name;
        }

        B_StatueBar{
            anchors.top: event_text.bottom;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
        }
    }

    SqlServer{
        id: sql;
    }
}
