import QtQuick
import QtQuick.Controls
import QtQml
import QtQuick.Layouts

Popup{
    id: root;
    width: 340;
    height: 340;
    background: Rectangle{
        radius: 20;
    }
//    closePolicy: Popup.NoAutoClose;
    GridView{
        id: grid;
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
                width: grid.width;
                height: grid.height/13;
                Repeater{
                    model: ["日", "一", "二", "三", "四", "五", "六"];
                    Item {
                        x: index*width;
                        width: grid.cellWidth;
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
                width: grid.cellWidth;
                height: grid.cellHeight;
                color: "transparent";
                Column{
                    anchors.centerIn: parent;
                    spacing: 10;

                    Item{
                        width: cellContent.width;
                        height: number.font.pixelSize
                        Text{
                            id: number;
                            anchors.horizontalCenter: parent.horizontalCenter;
                            anchors.bottom: parent.bottom;
                            font.pixelSize: 20;
                            font.bold: true;
                            text: timehelper.getDate(index,timehelper.year,timehelper.month);
                        }
                    }
                    Item{
                        width: cellContent.width; height: festival.font.pixelSize;
                        Text{
                            id: festival;
                            anchors.horizontalCenter: parent.horizontalCenter;
                            anchors.bottom: parent.bottom;
                            font.pixelSize: 10;
                            text: "廿一";
                        }
                    }
                }
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        console.log(timehelper.month);
                        console.log(timehelper.year);
                        console.log(new Date().getDay());
                    }
                }
            }
        }
    }
    Item{
        id: timehelper;
        property int month: new Date().getMonth()+1;
        property int year: new Date().getFullYear();

        function getDate(index, y, m){
            var days=getDaysInMonth(y,m);
            var start=new Date(y,m-1,1,0,0,0).getDay();
            if(start===7) start=0;
            var num=index-start+1;
            if(num<1) return getDaysInMonth(y,m-1)+num;
            else if(num>days) return num-days;
            else return num;
        }
        //获取这个月有多少天
        function getDaysInMonth(y,m){
            if(m<1){
                y-=1;
                m=12;
            }
            switch(m){
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12: return 31;
            case 4:
            case 6:
            case 9:
            case 11: return 30;
            case 2: if((y%4)===0 && ((y%100)!==0 || (y%400)===0)) return 29;
                    else return 28;
            }
        }
    }
}

