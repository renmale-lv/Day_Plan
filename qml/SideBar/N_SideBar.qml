import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T
import FramelessWindow
import QtQuick.Window

Item {
    id: root;
    property var mainWindow: parent;
    property int selectindex: 0;

    Rectangle{
        id: side_rectangle;
        anchors.fill: parent;
        radius: 20;
        color: "#A5C9CA";

        Row{
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.topMargin: 7;
            anchors.leftMargin: 14;
            height: 20;
            spacing: 7;

            T.Button{
                id: quitButton;
                width: 14;
                height: 14;
                background: Rectangle{
                    radius: 7;
                    color: quitButton.hovered ? "#e94d56" : Qt.lighter("#e94d56");
                }
                onClicked: {Qt.quit();}
            }
            T.Button{
                id: miniButton;
                width: 14;
                height: 14;
                background: Rectangle{
                    radius: 7;
                    color: miniButton.hovered ? "#f2bf2f" : Qt.lighter("#f2bf2f");
                }
                onClicked: {
                    if(mainWindow.visibility===Window.FullScreen){
                        mainWindow.visibility=Window.Windowed;
                    }else{
                        mainWindow.visibility=Window.FullScreen;
                    }
                }
            }
            T.Button{
                id: hideButton;
                width: 14;
                height: 14;
                background: Rectangle{
                    radius: 7;
                    color: hideButton.hovered ? "#2be33f" : Qt.lighter("#2be33f");
                }
                onClicked: {mainWindow.visibility=Window.Minimized;}
            }
        }

        Column{
            anchors.fill: parent;
            anchors.topMargin: 40;
            anchors.leftMargin: 7;
            anchors.rightMargin: 7;
            spacing: 10;

            N_CheckButton{
                color: "#395B64";
            }
            N_CheckButton{

            }
            N_CheckButton{

            }
        }
    }
}
