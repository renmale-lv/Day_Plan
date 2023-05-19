import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T

Item{
    Row{
        anchors.centerIn: parent;
        spacing: 5;
        T.Button{
            id: sub
            text: "<";
            width: 30
            height: 30;
            visible: true;
            background: Rectangle{
                anchors.fill: parent;
                radius: 15;
                color: "#404142";
                Text{
                    anchors.centerIn: parent;
                    text: sub.text;
                }
            }
        }
        Repeater{
            model: 7;
            T.Button{
                width: 30;
                height: 30;
                visible: true;
                background: Rectangle{
                    anchors.fill: parent;
                    radius: 15;
                    color: "#404142";
                    Text {
                        anchors.centerIn: parent;
                        text: "?"
                    }
                }
            }
        }
        T.Button{
            id: add
            text: ">";
            width: 30;
            height: 30;
            visible: true;
            background: Rectangle{
                anchors.fill: parent;
                radius: 15;
                color: "#404142";
                Text {
                    anchors.centerIn: parent;
                    text: add.text;
                }
            }
        }
    }
}
