import QtQuick 2.15
import QtQuick.Controls 2.15
import MyColorsModule 1.0

import "qrc:///Style.js" as MyStyle
import "../fonts"

Rectangle {
    id: root

    readonly property int spacer: 2
    property int nbItems: 0
    property int currentPage: 0
    property string currentRef: "?"
    property int currentMajorVersion: -1
    property int currentMinorVersion: -1
    property string currentDescription: "?"
    property string currentPhoto: ""

    radius: MyStyle.style_borderRadius
    border {
        width: MyStyle.style_margin
        color: Colors.style_midBrightColor
    }
    color: Colors.style_midDarkColor

    signal previous(int val)
    signal next(int val)

    FontLoader {
        id: webFont
        name: "FontAwesome"
        source: "../fonts/fontawesome-webfont.ttf"
    }

    Connections {
        ignoreUnknownSignals: true
        target: refLoader.item
    }

    Binding {
        target: refLoader.item
        property: "infoValue"
        value: currentRef
    }
    Binding {
        target: majorVersionLoader.item
        property: "infoValue"
        value: currentMajorVersion
    }
    Binding {
        target: minorVersionLoader.item
        property: "infoValue"
        value: currentMinorVersion
    }
    Binding {
        target: descriptionLoader.item
        property: "infoValue"
        value: currentDescription
    }

    Column {
        id: controlBar

        anchors.fill: parent; anchors.margins: MyStyle.style_marginXL

        Row {
            id: information

            width: parent.width; height: (parent.height-2*spacer)/8
            spacing: MyStyle.style_spacing

            Column {
                height: parent.height; width: (parent.width-parent.spacing)/2

                Text {
                    width: parent.width; height: (parent.height-parent.spacing)/2
                    text: nbItems
                    font {
                        pixelSize: MyStyle.style_titleT1
                        bold: true
                    }
                    color: Colors.style_brightColor
                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignHCenter
                }
                Text {
                    width: parent.width; height: (parent.height-parent.spacing)/2
                    text: "items"
                    font {
                        pixelSize: MyStyle.style_paragraph
                    }
                    color: Colors.style_brightColor
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            Item {
                height: parent.height; width: (parent.width-parent.spacing)/2

                Text {
                    anchors.fill: parent
                    text: currentPage
                    font {
                        pixelSize: MyStyle.style_paragraph
                        italic: true
                    }
                    color: Colors.style_brightColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
        Loader {
            height: spacer; width: parent.width - 2*MyStyle.style_spacing
            anchors.horizontalCenter: parent.horizontalCenter
            sourceComponent: spacerComponent
        }
        Row {
            id: navigation

            width: parent.width; height: (parent.height-2*spacer)*2/8

            Column {
                height: parent.height; width: parent.width/2

                Loader {
                    width: parent.width; height: parent.height/2
                    sourceComponent: iconComp
                    onStatusChanged: {
                        item.text = "\uf106"
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: root.previous(10)
                    }
                }
                Loader {
                    width: parent.width; height: parent.height/2
                    sourceComponent: iconComp
                    onStatusChanged: {
                        item.text = "\uf102"
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: root.previous(100)
                    }
                }
            }
            Column {
                height: parent.height; width: parent.width/2

                Loader {
                    width: parent.width; height: parent.height/2
                    sourceComponent: iconComp
                    onStatusChanged: {
                        item.text = "\uf107"
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: root.next(10)
                    }
                }
                Loader {
                    width: parent.width; height: parent.height/2
                    sourceComponent: iconComp
                    onStatusChanged: {
                        item.text = "\uf103"
                    }
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: root.next(100)
                    }
                }
            }
        }
        Loader {
            height: spacer; width: parent.width - 2*MyStyle.style_spacing
            anchors.horizontalCenter: parent.horizontalCenter
            sourceComponent: spacerComponent
        }
        Column {
            id: summary

            width: parent.width; height: (parent.height-2*spacer)*5/8

            Loader {
                id: refLoader
                width: parent.width; height: parent.height/6
                sourceComponent: infoComponent
            }
            Row {
                width: parent.width; height: parent.height/6

                Loader {
                    id: majorVersionLoader
                    height: parent.height; width: parent.width/2
                    sourceComponent: infoComponent
                }
                Loader {
                    id: minorVersionLoader
                    height: parent.height; width: parent.width/2
                    sourceComponent: infoComponent
                }
            }
            Loader {
                id: descriptionLoader
                width: parent.width; height: parent.height/6
                sourceComponent: infoComponent
            }
            Image {
                id: photoLoader
                width: parent.width - 2*MyStyle.style_margin; height: parent.height*3/6
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
                source: currentPhoto
            }
        }
    }

    Component {
        id: spacerComponent

        Rectangle {
            anchors.fill: parent
            color: Colors.style_midBrightColor
        }
    }

    Component {
        id: infoComponent

        Text {
            property string infoValue

            text: infoValue
            wrapMode: Text.Wrap
            font {
                pixelSize: MyStyle.style_titleT3
            }
            color: Colors.style_brightColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Component {
        id: iconComp

        Text {
            anchors.fill: parent
            font.pixelSize: 30
            font.family: webFont.name
            color: Colors.style_brightColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
