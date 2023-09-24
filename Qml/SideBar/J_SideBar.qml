import QtQuick

Item {
    id: root
    width: 0

    Rectangle{
        id: side_bar
        anchors.fill: parent
        color: "#eff5f3"
    }

    Behavior on width {
        NumberAnimation {duration: 200}
    }

    function show() {
        root.width = 250;
    }

    function hide() {
        root.width = 0;
    }
}