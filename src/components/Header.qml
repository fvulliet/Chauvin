import QtQuick 2.15
import QtQuick.Controls 2.15
import MyColorsModule 1.0

import "qrc:///Style.js" as MyStyle
import "../fonts"

Rectangle {
    color: Colors.style_brightColor

    FontLoader {
        id: webFont
        name: "FontAwesome"
        source: "../fonts/fontawesome-webfont.ttf"
    }

    Row {
        anchors.fill: parent
        anchors.margins: MyStyle.style_margin

        Item {
            id: logo

            height: parent.height; width: height

            Image {
                height: parent.height > 50 ? 50 : parent.height
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/chauvin_arnoux_logo.png"
                fillMode: Image.PreserveAspectFit
            }
        }
        Item {
            id: title

            height: parent.height; width: parent.width - logo.width - profile.width

            Text {
                anchors.fill: parent
                text: "Chauvin Arnoux gallery"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font {
                    bold: true
                    pixelSize: MyStyle.style_titleT1
                }
                color: Colors.style_darkTextColor
            }
        }
        Item {
            id: profile

            height: parent.height; width: height

            Text {
                height: parent.height > 50 ? 50 : parent.height
                anchors.centerIn: parent
                text: "\uf013"
                font.family: webFont.name
                font.pixelSize: 30
                color: Colors.style_midDarkColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    // rotation over all the available themes
                    if (Colors.getThemeName() === "theme1")
                        Colors.setThemeName("theme2")
                    else if (Colors.getThemeName() === "theme2")
                        Colors.setThemeName("theme3")
                    else if (Colors.getThemeName() === "theme3")
                        Colors.setThemeName("theme4")
                    else if (Colors.getThemeName() === "theme4")
                        Colors.setThemeName("theme5")
                    else if (Colors.getThemeName() === "theme5")
                        Colors.setThemeName("theme1")
                }
            }

        }
    }

}


