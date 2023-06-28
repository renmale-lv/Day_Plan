import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T
import QtQuick.Dialogs

import "../Base"

import SqlServer

Item {
    B_DateSelector{
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
        onAddevent: {
            parent.update();
            console.log("update");
        }
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
                        event_detail.event=parent.modeldata;
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

        property var event;
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
            anchors.top: endTime.bottom;
            anchors.margins: 10;
            font.family: "华文楷体";
            font.pixelSize: 12;
            text: parent.event.detail==="" ? "/详细信息" : parent.event.detail;
            color: parent.event.detail==="" ? "#e0e0e0" : "#ffffff";
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
                deldialog.open();
                deldialog.mid=parent.event.id;
                deldialog.mtext=parent.event.name;
            }
        }

        B_TimeSelector{
            id: startTime;
            anchors.top: event_statue.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.margins: 10;
            text: "开始时间";
            old: parent.event.starttime;
        }

        B_TimeSelector{
            id: endTime;
            anchors.top: startTime.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.margins: 10;
            text: "结束时间";
            visible: true;
        }
    }

    SqlServer{
        id: sql;
    }

    N_DelDialog{
        id: deldialog;
        visible: false;
        x: parent.width/2-width/2;
        y: parent.height/2-height/2;

        onAccepted: {
            sql.delete_daytodo_event(mid);
            event_detail.visible=false;
            update();
        }
    }

    function update(){
        event_list.model=sql.get_daytodo_event(calendar.day);
    }
}

