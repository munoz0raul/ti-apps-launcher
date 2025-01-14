import QtQml 2.1
import QtQuick 2.14
import QtMultimedia 5.1
import QtQuick.Window 2.14
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.12
import Qt.labs.folderlistmodel 2.4

import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

Rectangle {
    width: parent.width
    height: parent.height
    color: "#17252A"
    Rectangle {
        id: leftSubMenu

        width: parent.width * 0.9
        height: parent.height * 0.9
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "#344045"

        border.color: "#DEF2F1"
        border.width: 3
        radius: 10

        ColumnLayout {
            anchors.topMargin: leftSubMenu.height * 0.05
            anchors.bottomMargin: leftSubMenu.height * 0.05
            anchors.fill: leftSubMenu
            spacing: 10
            Repeater {
                model: appsmenu.button_getcount()

                Button {
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: leftSubMenu.width * 0.9
                    Layout.preferredHeight: parent.height * 0.08

                    text: appsmenu.button_getname(index)
                    icon.source: appsmenu.button_geticon(index)

                    contentItem: Rectangle {
                        anchors.fill: parent
                        color: "#EfEfEf"
                        Image {
                            id: button_icon
                            source: parent.parent.icon.source
                            height: parent.height * 0.8
                            width: height
                            anchors.left: parent.left
                            anchors.leftMargin: parent.width * 0.05
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            id: button_text
                            text: parent.parent.text
                            anchors.left: button_icon.right
                            anchors.leftMargin: parent.width * 0.05
                            anchors.rightMargin: parent.width * 0.05
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                            font.family: "Helvetica"
                            font.pixelSize: parent.width * 0.07
                        }
                    }

                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                        horizontalOffset: height * 0.15
                        verticalOffset: height * 0.15
                    }

                    onClicked: appWindow.source = appsmenu.button_getqml(index)
                }
            }
        }
    }
}

