import QtQuick
import QtQuick.Controls
import QtQml
import QtQuick.Layouts
import QtQuick.Templates as T

import SqlServer

Popup{
    id: root;
    background: Rectangle{
        anchors.fill: parent;
        radius: 20;
    }



    SqlServer{
        id: sql;
    }
}
