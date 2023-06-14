import QtQuick


Rectangle{
    property int index;
    property int statue;
    width: 120;
    height: 20;
    radius: 10;
    color: "#dbeddb";
    Text{
        anchors.centerIn: parent;
        text: "completed";
    }
    Rectangle{
        color: "green";
        width: 12;
        height: 12;
        radius: 6;
        anchors.left: parent.left;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.leftMargin: 4;
    }
}
