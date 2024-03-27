import QtQuick 2.15
import QtQuick.Controls 2.15
import middleWare 1.0
import MyColorsModule 1.0

import "qrc:///Style.js" as MyStyle

Item {
    id: root

    property bool showDevices: false
    property DeviceViewer deviceViewer: DeviceViewer{}

    Row {
        id: payloadContent

        anchors.fill: parent
        anchors.margins: MyStyle.style_margin
        spacing: MyStyle.style_spacing
        opacity: payload.showDevices ? 1 : 0
        visible: opacity > 0 // save some memory : don't display at all when opacity <= 0
        Behavior on opacity { NumberAnimation {} }

        Item {
            id: controlBarContainer

            height: parent.height
            width: (parent.width-parent.spacing)*30/100 > 200 ? 200 : (parent.width-parent.spacing)*30/100

            ControlBar {
                id: controlBar

                anchors.fill: parent; anchors.margins: MyStyle.style_marginXL
                nbItems: devicesList.count
                currentPage: devicesList.currentPage
                onPrevious: devicesList.previous(val)
                onNext: devicesList.next(val)
            }
        }

        Rectangle {
            id: picturesCtnr

            height: parent.height; width: parent.width - parent.spacing - controlBarContainer.width
            color: Colors.style_midBrightColor

            ListView {
                id: devicesList

                property int itemHeight: MyStyle.style_listItemHeight
                property bool navigable: count*itemHeight > height
                property bool topReached: contentY <= 0
                property bool bottomReached: (contentY + height) >= (contentHeight - 0.1)
                property int currentPage: Math.ceil(contentY/height)

                function goToTop() {
                    contentY = 0
                }

                function goToBottom() {
                    contentY = devicesList.contentHeight - devicesList.height - 0.1
                }

                function previous(val) {
                    if (contentY > val*devicesList.height)
                        contentY -= val*devicesList.height
                    else
                        goToTop()
                    // if (topReached)
                    //     goToTop()
                }

                function next(val) {
                    if (contentY < (devicesList.contentHeight - devicesList.height - 0.1 * val*devicesList.height))
                        contentY += val*devicesList.height
                    else
                        goToBottom()
                    // if (bottomReached)
                    //     goToBottom()
                }

                anchors.fill: parent; anchors.margins: MyStyle.style_marginXL
                model: deviceViewer.getDevicesModel() // get the model from middleware
                interactive: contentHeight > height
                clip: interactive
                boundsBehavior: Flickable.StopAtBounds
                currentIndex: count > 0 ? 0 : -1 // point on the first item, if the list is not empty
                delegate: Device {
                    selected: ListView.view.currentIndex === index

                    width: ListView.view.width
                    height: ListView.view.itemHeight

                    myRef: ref
                    myMajorVersion: majorV
                    myMinorVersion: minorV
                    myDescription: description
                    myPhoto: photo

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            devicesList.currentIndex = index
                            controlBar.currentRef = ref
                            controlBar.currentMajorVersion = majorV
                            controlBar.currentMinorVersion = minorV
                            controlBar.currentDescription = description
                            controlBar.currentPhoto = photo
                        }
                    }
                }

                Behavior on contentY {
                    NumberAnimation { easing.type: Easing.InOutQuad }
                }

                ScrollBar.vertical: ScrollBar {
                    parent: devicesList.parent
                    policy: devicesList.interactive ? ScrollBar.AlwaysOn : ScrollBar.AsNeeded
                    anchors {
                        top: devicesList.top
                        right: devicesList.right
                        bottom: devicesList.bottom
                    }
                }
            }
        }
    }

    LandingPage {
        anchors.fill: parent
        visible: opacity > 0
        opacity: payload.showDevices ? 0 : 1
        Behavior on opacity { NumberAnimation {} }
    }
}
