import QtQuick 2.15

Item {
    Rectangle{
        id: album;
        anchors.top: parent.top;
        anchors.left: parent.left;
        implicitWidth: 350;
        implicitHeight: 400;
        radius: 20;
        color: "#DDDDDD"
        Text{
            anchors.fill: parent;
            text: "Music";
            verticalAlignment: Qt.AlignVCenter;
            horizontalAlignment: Qt.AlignHCenter;
        }
    }

    Rectangle{
        id: lyrics;
        anchors.top: album.bottom;
        anchors.left: parent.left;
        anchors.bottom: parent.bottom;
        anchors.topMargin: 7;
        implicitWidth: 350;
        radius: 20;
        color: "#DDDDDD"
    }

    Rectangle{
        id: music;
        anchors.top: parent.top;
        anchors.left: album.right;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.leftMargin: 7;
        radius: 20;
        color: "#DDDDDD";
    }
}
