import QtQuick
import QtQuick.Controls
import QtQml
import QtQuick.Templates as T

import SqlServer

Item{
    id: root;
    visible: false;
    property var event;
    background: Rectangle{
        anchors.fill: parent;
        radius: 20;
    }

    


    SqlServer{
        id: sql;
    }
}
