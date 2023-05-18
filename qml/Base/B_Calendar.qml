import QtQuick

Rectangle{
    width: 320;
    height: 320;
    radius: 20;


    GridView{
        id: root;
        anchors.fill: parent;
        anchors.margins: 10;
        cellHeight: 2*height/13;
        cellWidth: width/7;
        header: weekStatus
        model: 42;
        delegate: dateGridDeldgate;

        Component{
            id: weekStatus;
            Item{
                width: root.width;
                height: root.height/13;
                Repeater{
                    model: ["日", "一", "二", "三", "四", "五", "六"];
                    Item {
                        x: index*width;
                        width: root.cellWidth;
                        height: weekStatus.height;

                        Text{
                            anchors.centerIn: parent;
                            text: model.modelData;
                            font.pixelSize: 14;
                            color: "#666666";
                        }
                    }
                }
            }
        }

        Component{
            id: dateGridDeldgate
            Rectangle{
                id: cellContent;
                width: root.cellWidth;
                height: root.cellHeight;
                border.width: 1;

            }
        }
    }
}
