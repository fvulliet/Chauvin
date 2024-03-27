import QtQuick 2.15
import QtQuick.Controls 2.15
import MyColorsModule 1.0

import "qrc:///Style.js" as MyStyle

Rectangle {
    color: Colors.style_brightColor

    Row {
        anchors.fill: parent

        // Item {
        //     height: parent.height; width: parent.width/2

        //     Button {
        //         // native-style button
        //         height: parent.height/2 > 100 ? 100 : parent.height/2
        //         width: parent.width/2 > 200 ? 200 : parent.width/2
        //         anchors.centerIn: parent
        //         text: "SHOW"
        //         onClicked: payload.showDevices = true
        //     }
        // }
        Item {
            height: parent.height; width: parent.width

            Button {
                // native-style button
                height: parent.height/2 > 100 ? 100 : parent.height/2
                width: parent.width/2 > 200 ? 200 : parent.width/2
                anchors.centerIn: parent
                text: "HIDE"
                onClicked: payload.showDevices = false
            }
        }
    }
}
