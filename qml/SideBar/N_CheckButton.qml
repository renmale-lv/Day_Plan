import QtQuick
import QtQuick.Controls

Item {
    id: root;
    property int index: 0;
    property bool checked: false;
    property color color: "#395B64";

    height: 40;
    width: 186;

    onCheckedChanged: {
        if(checked){
            button.color=root.color
        }else{
            button.color=Qt.lighter(root.color,1.7);
        }
    }

    Rectangle{
        id: button;
        anchors.fill: parent;
        radius: 10;

        MouseArea{
            id: mousearea;
            anchors.fill: parent;
            acceptedButtons: Qt.LeftButton;
            hoverEnabled: true;
            propagateComposedEvents: fasle;
            onClicked: {
                root.checked=true;
                return;
            }
            onEntered: {
                if(root.checked) return;
                button.color=Qt.lighter(root.color,1.3);
            }
            onExited: {
                if(root.checked) return;
                button.color=Qt.lighter(root.color,1.7);
            }
            onPressed: {
                if(root.checked) return;
                button.color=root.color;
            }


        }
        color: Qt.lighter(root.color,1.7);

    }
}
