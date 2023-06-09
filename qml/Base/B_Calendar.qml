import QtQuick
import QtQuick.Controls
import QtQml
import QtQuick.Layouts
import QtQuick.Templates as T

import LunarDateHelper

Popup{
    id: root;
    width: 340;
    height: 380;
    background: Rectangle{
        radius: 20;
    }
    Item{
        id: yearandmonth;
        property int month: new Date().getMonth()+1;
        property int year: new Date().getFullYear();
        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.right: parent.right;
        height: 40;

        T.Button{
            id: lastyearbutton;
            anchors.left: parent.left;
            anchors.leftMargin: 15;
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            height: 40;
            width: 40;
            enabled: parent.year===1990 ? false : true;
            background: Rectangle{
                radius: 10;
                Text{
                    anchors.centerIn: parent;
                    text: "<<";
                    color: parent.enabled ? "#000000" : "#a0a0a0";
                }
                color: parent.pressed ? "#e0e0e0" : (parent.hovered ? "#f0f0f0" : "transparent");
            }
            onClicked: {
                parent.year-=1;
            }
        }
        T.Button{
            id: lastmonthbutton;
            anchors.left: lastyearbutton.right;
            anchors.leftMargin: 5;
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            height: 40;
            width: 40;
            enabled: (parent.year===1990 && parent.month===1) ? false : true;
            background: Rectangle{
                radius: 10;
                Text{
                    anchors.centerIn: parent;
                    text: "<";
                    color: "#000000";
                }
                color: parent.pressed ? "#e0e0e0" : (parent.hovered ? "#f0f0f0" : "transparent");
            }
            onClicked: {
                if(parent.month===1){
                    parent.year-=1;
                    parent.month=12;
                }
                else parent.month-=1;
            }
        }
        T.Button{
            id: nextmonthbutton;
            anchors.right: nextyearbutton.left;
            anchors.rightMargin: 5;
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            height: 40;
            width: 40;
            enabled: (parent.year===2090 && parent.month===12) ? false : true;
            background: Rectangle{
                radius: 10;
                Text{
                    anchors.centerIn: parent;
                    text: ">";
                    color: "#000000";
                }
                color: parent.pressed ? "#e0e0e0" : (parent.hovered ? "#f0f0f0" : "transparent");
            }
            onClicked: {
                if(parent.month===12){
                    parent.year+=1;
                    parent.month=1;
                }
                else parent.month+=1;
            }
        }
        T.Button{
            id: nextyearbutton;
            anchors.right: parent.right;
            anchors.rightMargin: 15;
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            height: 40;
            width: 40;
            enabled: (parent.year===2090) ? false : true;
            background: Rectangle{
                radius: 10;
                Text{
                    anchors.centerIn: parent;
                    text: ">>";
                    color: "#000000";
                }
                color: parent.pressed ? "#e0e0e0" : (parent.hovered ? "#f0f0f0" : "transparent");
            }
            onClicked: {
                parent.year+=1;
            }
        }
        T.Button{
            id: resetbutton;
            anchors.left: lastmonthbutton.right;
            anchors.right: nextmonthbutton.left;
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            anchors.leftMargin: 5;
            anchors.rightMargin: 5;
            background: Rectangle{
                radius: 10;
                Text{
                    anchors.centerIn: parent;
                    text: yearandmonth.year+" 年 "+yearandmonth.month+" 月";
                    color: "#000000";
                }
                color: parent.pressed ? "#e0e0e0" : (parent.hovered ? "#f0f0f0" : "transparent");
            }
            onClicked: {
                yearandmonth.year=new Date().getFullYear();
                yearandmonth.month=new Date().getMonth()+1;
            }
        }
    }

    GridView{
        id: grid;
        anchors.top: yearandmonth.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
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
                            color: timehelper.getColor(index,timehelper.year,timehelper.month);
                        }
                    }
                    Item{
                        width: cellContent.width; height: festival.font.pixelSize;
                        Text{
                            id: festival;
                            anchors.horizontalCenter: parent.horizontalCenter;
                            anchors.bottom: parent.bottom;
                            font.pixelSize: 10;
                            text: lunarDateHelper.changeLuanrFromSolar(timehelper.year,timehelper.month,number.text);
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
        property int month: yearandmonth.month;
        property int year: yearandmonth.year;

        function getDate(index, y, m){
            var days=getDaysInMonth(y,m);
            var start=new Date(y,m-1,1,0,0,0).getDay();
            if(start===7) start=0;
            var num=index-start+1;
            if(num<1) return getDaysInMonth(y,m-1)+num;
            else if(num>days) return num-days;
            else return num;
        }
        function getColor(index, y, m){
            var days=getDaysInMonth(y,m);
            var start=new Date(y,m-1,1,0,0,0).getDay();
            if(start===7) start=0;
            var num=index-start+1;
            if(num<1) return "#e0e0e0";
            else if(num>days) return "#e0e0e0";
            else return "#000000";
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

    LunarDateHelper{
        id: lunarDateHelper;
    }
}

