import QtQuick


Rectangle{
    property int statue;
    width: 100;
    height: 20;
    radius: 10;
    color: {
        switch(statue){
            case 0: return "#f1f0ef";
            case 1: return "#dbeddb";
            case 2: return "#ffe2dd";
            case 3: return "#f5e0e9";
        }
    }

    Text{
        anchors.centerIn: parent;
        text: {
            switch(statue){
                case 0: return "uncompleted";
                case 1: return "completed";
                case 2: return "delay";
                case 3: return "failed";
            }
        }
        font.family: "华文宋体";
    }
    Rectangle{
        color: {
            switch(statue){
                case 0: return "#91918e";
                case 1: return "#6c9b7d";
                case 2: return "#e16f64";
                case 3: return "#cd749f";
            }
        }
        width: 12;
        height: 12;
        radius: 6;
        anchors.left: parent.left;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.leftMargin: 4
    }
}
