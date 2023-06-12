import QtQuick
import QtQuick.Controls
import QtQml
import QtQuick.Layouts
import QtQuick.Templates as T

import LunarDateHelper

Popup{
    id: root;
    width: 340;
    height: 360;
    background: Rectangle{
        radius: 20;
    }

    property int m_year: new Date().getFullYear();
    property int m_month: new Date().getMonth()+1;
    property int m_day: new Date().getDate();


    Item{
        id: yearandmonth;
        property int month: root.m_month;
        property int year: root.m_year;
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
            enabled: (parent.year===2090 && parent.month===12) ? false : true;
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
                root.m_year=new Date().getFullYear();
                root.m_month=new Date().getMonth()+1;
                root.m_day=new Date().getDate();
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
        //禁止GridView拖动
        interactive: false;

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
                            color: "#000000";
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
                radius: 10;
                property bool m_hover: false;
                Rectangle{
                    anchors.horizontalCenter: parent.horizontalCenter;
                    color: (number_item.today[0]===root.m_year && number_item.today[1]===root.m_month && number_item.today[2]===root.m_day) ? "#4fe1fc" : (parent.m_hover ? "#e0e0e0" : "transparent");
                    width: 40;
                    height: 40;
                    radius: 10;
                }
                Column{
                    anchors.centerIn: parent;
                    spacing: 10;

                    Item{
                        width: cellContent.width;
                        height: number.font.pixelSize;
                        property var today: timehelper.getDate(index,timehelper.year,timehelper.month);
                        id: number_item;
                        Text{
                            id: number;
                            anchors.horizontalCenter: parent.horizontalCenter;
                            anchors.bottom: parent.bottom;
                            font.pixelSize: 20;
                            font.bold: true;
                            text: parent.today[2];
                            color: parent.today[1]===timehelper.month ? "#000000" : "#e0e0e0";
                        }
                    }
                    Item{
                        width: cellContent.width; height: festival.font.pixelSize;
                        Text{
                            id: festival;
                            anchors.horizontalCenter: parent.horizontalCenter;
                            anchors.bottom: parent.bottom;
                            anchors.bottomMargin: 10;
                            font.pixelSize: 10;
                            text: lunarDateHelper.changeLuanrFromSolar(number_item.today[0],number_item.today[1],number_item.today[2]);
                            color: number_item.today[1]===timehelper.month ? "#000000" : "#e0e0e0";
                        }
                    }
                }
                MouseArea{
                    anchors.fill: parent;
                    hoverEnabled: true;
                    onClicked: {
                        //注意顺序不能反
                        root.m_day=number_item.today[2];
                        root.m_month=number_item.today[1];
                        root.m_year=number_item.today[0];
                    }
                    onEntered: {
                        parent.m_hover=true;
                    }
                    onExited: {
                        parent.m_hover=false;
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
            var _years=year;
            var _month=month;
            var days=getDaysInMonth(y,m);
            var start=new Date(y,m-1,1,0,0,0).getDay();
            if(start===7) start=0;
            var num=index-start+1;
            if(num<1){
                num=getDaysInMonth(y,m-1)+num;
                if(_month===1){
                    _month=12;
                    _years-=1;
                }else{
                    _month-=1;
                }
            }
            else if(num>days){
                num=num-days;
                if(_month===12){
                    _years+=1;
                    _month=1;
                }else{
                    _month+=1;
                }
            }
            return [_years,_month,num];
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

    //农历计算组件
    LunarDateHelper{
        id: lunarDateHelper;
    }
}

