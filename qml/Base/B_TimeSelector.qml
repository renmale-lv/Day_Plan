import QtQuick
import QtQuick.Templates as T

Item {
    height: 20;
    property string text;

    property date old;
    property int m_year: calendar.m_year;
    property int m_month: calendar.m_month;
    property int m_day: calendar.m_day;

    Text{
        id: text;
        anchors.left: parent.left;
        anchors.verticalCenter: parent.verticalCenter;
        text: parent.text;
        font.family: "华文楷体";
        font.pixelSize: 16;
    }

    T.Button{
        id: button;
        anchors.left:text.right;
        anchors.right: parent.right;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.leftMargin: 10;
        onClicked: {
            calendar.visible=true;
        }
        background: Rectangle{
            anchors.fill: parent;
            border.width: 1;
            Text{
                anchors.centerIn: parent;
                text: calendar.m_year+"/"+calendar.m_month+"/"+calendar.m_day;
                font.family: "华文楷体";
                font.pixelSize: 16;
            }
        }
    }

    B_Calendar{
        id: calendar;
        x: button.x+button.width-this.width;
        y: button.y+button.height;
        m_year: old.getFullYear();
        m_month: old.getMonth()+1;
        m_day: old.getDate();
    }

}
