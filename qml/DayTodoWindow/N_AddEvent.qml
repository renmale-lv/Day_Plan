import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls

Rectangle{
    id: root;
    implicitHeight: 40;
    radius: 20;
    color: "#DDDDDD";

    TextEdit{
        id: text_edit;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: parent.left;
        anchors.right: add_button.left;
        anchors.leftMargin: 10;
        anchors.rightMargin: 10;
        font.pixelSize: 18;
    }

    T.Button{
        id: add_button;
        width: 34;
        height: 34;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.right: parent.right;
        anchors.rightMargin: 3;
        background: Rectangle{
            anchors.fill: parent;
            radius: 17;
            color: "#ffef72";
            Text {
                text: "+";
                anchors.centerIn: parent;
            }
        }
    }
}
