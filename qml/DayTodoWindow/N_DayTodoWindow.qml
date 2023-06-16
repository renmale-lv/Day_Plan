import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T

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
                height: 40;
                radius: 10;
                color: "pink";
                property var modeldata: event_list.model[index];
                Text {
                    id: text;
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.left: parent.left;
                    anchors.topMargin: 10;
                    anchors.leftMargin: 10;
                    anchors.bottomMargin: 10;
                    font.pixelSize: 16;
                    font.family: "华文楷体";
                    text: modeldata.name;
                }
                B_StatueBar{
                    anchors.left: text.right;
                    anchors.leftMargin: 10;
                    anchors.verticalCenter: parent.verticalCenter;
                    statue: modeldata.statue;
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
            text: parent.event.name;
        }

        B_StatueBar{
            id: event_statue;
            statue: parent.event.statue;
            anchors.top: event_text.bottom;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
        }

        TextEdit{
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.bottom: parent.bottom;
            anchors.top: event_statue.bottom;
            anchors.margins: 7;
            font.family: "华文楷体";
            font.pixelSize: 12;
        }

        T.Button{
            id: back_button;
            width: 40;
            height: 40;
            anchors.top: parent.top;
            anchors.right: parent.right;
            anchors.margins: 10;
            background: Rectangle{
                anchors.fill: parent;
                radius: 10;
                Text{
                    anchors.centerIn: parent;
                    text: ">";
                    font.family: "华文楷体";
                    font.pixelSize: 20;
                }
                color: back_button.hovered ? "#e0e0e0" : "transparent";
            }
            onClicked: {
                event_detail.visible=false;
            }
        }

        T.Button{
            id: delete_button;
            width: 40;
            height: 40;
            anchors.bottom: parent.bottom;
            anchors.left: parent.left;
            anchors.margins: 10;
            background: Rectangle{
                anchors.fill: parent;
                radius: 10;
                color: delete_button.hovered ? "#e0e0e0" : "transparent";
            }
            onClicked: {
                //todo：根据id删除
            }
        }
    }

    SqlServer{
        id: sql;
    }
}
