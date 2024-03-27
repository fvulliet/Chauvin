import QtQuick 2.15
import QtQuick.Controls 2.15
import "./components" as Components
import MyColorsModule 1.0

import "qrc:///Style.js" as MyStyle

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600
    title: qsTr("Chauvin Arnoux CI demo")

    Component.onCompleted: {
        // fill the colors of the default theme
        Colors.setThemeName("theme1")
    }

    Rectangle {
        anchors.fill: parent
        color: Colors.style_darkColor

        Column {
            anchors.fill: parent
            spacing: MyStyle.style_spacing

            Components.Header {
                id: header

                width: parent.width; height: (parent.height-2*parent.spacing) * 10/100
            }

            Components.Payload {
                id: payload

                width: parent.width; height: (parent.height-2*parent.spacing) * 80/100
            }

            Components.Footer {
                width: parent.width; height: (parent.height-2*parent.spacing) * 10/100
            }
        }
    }
}
