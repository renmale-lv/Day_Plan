import QtQuick 2.15

Item {
    Rectangle{
        id: month;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.top: parent.top;
        height: 40;
        color: "yellow";
        radius: 20;
    }

    Rectangle{
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.top: month.bottom;
        anchors.topMargin: 10;
        radius: 20;
        color: "#DDDDDD"
        Text{
            anchors.fill: parent;
            text: "Overview";
            verticalAlignment: Qt.AlignVCenter;
            horizontalAlignment: Qt.AlignHCenter;
        }
    }
}
