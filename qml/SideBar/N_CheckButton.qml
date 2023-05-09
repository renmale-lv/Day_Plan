import QtQuick
import QtQuick.Controls

//自定义单选按钮
RadioButton{
    id: root;
    implicitHeight: 40;
    implicitWidth: 186;
    property color ncolor: "#395B64";
    indicator: null;
    property int index;

    contentItem: Text {
        text: root.text;
        verticalAlignment: Text.AlignVCenter;
        leftPadding: 15;
        font.family: "Bitstream Charter";
    }

    background: Rectangle{
        id: button;
        anchors.fill: root;
        radius: 10;
        color: Qt.lighter(root.ncolor,1.7);

        MouseArea{
            anchors.fill: parent;
            acceptedButtons: Qt.LeftButton;
            hoverEnabled: true;
            onEntered: {
                if(root.checked) return;
                button.color=Qt.lighter(root.ncolor,1.3);
            }
            onExited: {
                if(root.checked) return;
                button.color=Qt.lighter(root.ncolor,1.7);
            }
        }
    }
    onCheckedChanged: {
        if(checked){
            button.color=Qt.lighter(root.ncolor,1);
        }else{
            button.color=Qt.lighter(root.ncolor,1.7);
        }
    }
}
