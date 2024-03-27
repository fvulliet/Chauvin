import QtQuick 2.15
import QtQuick.Controls 2.15
import MyColorsModule 1.0

import "qrc:///Style.js" as MyStyle
import "../fonts"

Rectangle {
    id: root

    property double opacityRatio: 1

    anchors.fill: parent
    color: Colors.style_midDarkColor

    FontLoader {
        id: webFont
        name: "FontAwesome"
        source: "../fonts/fontawesome-webfont.ttf"
    }

    Column {
        anchors.fill: parent
        spacing: MyStyle.style_spacingXL

        Item {
            width: parent.width; height: (parent.height-parent.spacing)/2

            Text {
                anchors.fill: parent
                text: "\uf1c0"
                font.family: webFont.name
                font.pixelSize: 50
                color: Colors.style_brightTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                opacity: opacityRatio

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: payload.showDevices = true
                }
            }
        }
        Item {
            width: parent.width; height: (parent.height-parent.spacing)/2

            Text {
                anchors.fill: parent
                text: "Want to see some devices ?"
                font {
                    pixelSize: MyStyle.style_punchline
                }
                color: Colors.style_brightTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
            }
        }
    }

    SequentialAnimation {
        loops: Animation.Infinite
        running: root.visible

        NumberAnimation {
            target: root
            property: "opacityRatio"; from: 1; to: 1/1.618
            easing.type: Easing.Linear; duration: 1000
        }
        NumberAnimation {
            target: root
            property: "opacityRatio"; from: 1/1.618; to: 1
            easing.type: Easing.Linear; duration: 1000
        }
    }
}
