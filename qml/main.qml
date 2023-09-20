import QtQuick 2.0
import QtQuick.Controls 2.1
import Test 1.0
import QtQuick.Templates as T

FramelessWindow {
    id: framelessWindow
    minimumHeight: 800
    minimumWidth: 1300
    visible: true

    default property alias content: content.children

    Item {
        id: content
        anchors.fill: parent
        anchors.margins: framelessWindow.borderMargins
        z: -100
    }


    property Component titleItem: Component {
        id: titleCom
        Item {
            id: title
            anchors.fill: parent

            // 最小化、最大化、关闭按钮
            Row {
                spacing: 7

                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    rightMargin: 10
                    top: parent.top
                }
                T.Button {
                    id: minButton
                    anchors.verticalCenter: parent.verticalCenter
                    height: 16
                    width: 16

                    onClicked: {
                        showMinimized();
                    }

                    background: Rectangle {
                        color: minButton.hovered ? "#2be33f" : "#86ff93"
                        radius: 8
                    }
                }
                T.Button {
                    id: maxButton
                    anchors.verticalCenter: parent.verticalCenter
                    height: 16
                    width: 16

                    onClicked: {
                        if (isMaximized()) {
                            showNormal();
                        } else {
                            showMaximized();
                        }
                    }

                    background: Rectangle {
                        color: maxButton.hovered ? "#f2bf2f" : "#ffe69e"
                        radius: 8
                    }
                }
                T.Button {
                    id: closeButton
                    anchors.verticalCenter: parent.verticalCenter
                    height: 16
                    width: 16

                    onClicked: {
                        close();
                    }

                    background: Rectangle {
                        color: closeButton.hovered ? "#e94d56" : "#ffb3b7"
                        radius: 8
                    }
                }
            }

            // Logo
            Row {
                id: logoRow
                spacing: 7

                anchors {
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                }
                Image {
                    id: logo
                    height: 30
                    source: "qrc:/Images/Logo.png"
                    width: 30

                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }
                }
                Text {
                    id: logoText
                    text: "Journal"

                    font {
                        family: "鍗庢枃妤蜂綋"
                        pixelSize: 18
                    }
                    anchors {
                        left: logo.right
                        leftMargin: 5
                        verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
    }

    Loader {
        id: titleLoader
        height: 35
        sourceComponent: titleCom

        onLoaded: {
            setTitleBar(titleLoader.item);
        }

        anchors {
            left: content.left
            right: content.right
            top: content.top
        }
    }
}
