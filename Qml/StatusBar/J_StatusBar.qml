import QtQuick
import QtQuick.Templates as T

Item {
    id: root
    height: 35;
    width: 100;

    signal menuButtonClicked()

    Row{
        anchors {
            fill: parent
            leftMargin: 10
        }
        spacing: 7;

        T.Button{
            id: menuButton
            width: 30
            height: 30

            background:Rectangle{
                anchors.fill: parent
                radius: 4

                color: menuButton.hovered ? "#eff5f3" : "yellow"
            }

            onClicked : {
                menuButtonClicked()
            }
        }
    }

    Behavior on width{ NumberAnimation { duration: 200 } }
}
