import QtQuick 2.15
import QtQuick.Controls 2.15
import MyColorsModule 1.0

import "qrc:///Style.js" as MyStyle

Item {
    id: root

    property bool selected

    property string myRef
    property int myMajorVersion
    property int myMinorVersion
    property string myDescription
    property string myPhoto

    Rectangle {
        id: container

        property int focusRatio: 1

        anchors.fill: parent
        anchors.topMargin: MyStyle.stye_margin; anchors.bottomMargin: MyStyle.style_margin
        color: Colors.style_brightColor
        border {
            width: MyStyle.style_margin
            color: Colors.style_darkColor
        }
        radius: MyStyle.style_borderRadiusXS

        states: State {
            when: selected
            PropertyChanges {
                target: container
                border.color: Qt.lighter(Colors.style_darkColor, 1.5)
                border.width: MyStyle.style_margin*2
                focusRatio: 1.2
                color: Qt.lighter(Colors.style_brightColor, 1.5)
            }
        }
        transitions: Transition {
            ParallelAnimation {
                NumberAnimation {
                    properties: "focusRatio, border.width"
                    easing.type: Easing.InOutQuad
                }
                ColorAnimation {}
            }
        }

        Row {
            anchors.fill: parent; anchors.margins: container.border.width + MyStyle.style_margin
            spacing: MyStyle.style_spacing

            Image {
                height: parent.height; width: parent.height
                fillMode: Image.PreserveAspectFit
                source: myPhoto
            }
            Column {
                height: parent.height; width: parent.width - 2*parent.spacing - 2*parent.height

                Text {
                    height: parent.height/2; width: parent.width
                    text: myRef
                    font {
                        pixelSize: MyStyle.style_titleT3 * container.focusRatio
                        bold: true
                    }
                    color: Colors.style_darkTextColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    height: parent.height/2; width: parent.width
                    text: myDescription
                    font {
                        pixelSize: MyStyle.style_paragraph * container.focusRatio
                    }
                    color: Colors.style_darkTextColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }
            }
            Column {
                height: parent.height; width: parent.height

                Text {
                    height: parent.height/3; width: parent.width
                    text: "version"
                    font {
                        pixelSize: MyStyle.style_paragraph * container.focusRatio
                        bold: true
                    }
                    color: Colors.style_darkTextColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    height: parent.height/3; width: parent.width
                    text: myMajorVersion
                    font {
                        pixelSize: MyStyle.style_paragraph * container.focusRatio
                        bold: true
                    }
                    color: Colors.style_darkTextColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    height: parent.height/3; width: parent.width
                    text: myMinorVersion
                    font {
                        pixelSize: MyStyle.style_paragraph * 0.9 * container.focusRatio
                    }
                    color: Colors.style_darkTextColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }
}
