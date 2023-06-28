import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls

import SqlServer

Rectangle{
    id: root;
    implicitHeight: 40;
    radius: 20;
    color: "#DDDDDD";
    signal addevent();


    TextInput{
        id: text_edit;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: parent.left;
        anchors.right: add_button.left;
        anchors.leftMargin: 10;
        anchors.rightMargin: 10;
        font.pixelSize: 18;

        Keys.onReturnPressed:  {
            if(text==="") return;
            sql.add_event(text_edit.text);
            console.log(text_edit.text+" 创建成功");
            parent.addevent();
            text="";
        }
    }

    T.Button{
        id: add_button;
        width: hovered ? 70 : 60;
        height: hovered ? 34 : 30;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.right: parent.right;
        anchors.rightMargin: hovered ? 3 : 5;
        visible: text_edit.length===0 ? false : true;
        background: Rectangle{
            anchors.fill: parent;
            radius: 17;
            color: "#ffef72";
            Text {
                text: "创建";
                font.pixelSize: add_button.hovered ? 14 : 12;
                anchors.centerIn: parent;
            }
        }
        onClicked: {
            sql.add_event(text_edit.text);
            console.log(text_edit.text+" 创建成功");
            parent.addevent();
            text_edit.text="";
        }
    }

    SqlServer{
        id: sql;
    }

}
