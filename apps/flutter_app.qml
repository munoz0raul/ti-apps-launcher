import QtQml 2.1
import QtQuick 2.14
import QtMultimedia 5.1
import QtQuick.Window 2.14
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.12
import Qt.labs.folderlistmodel 2.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
Rectangle {
    id: flutter 
    visible: true
    anchors.fill: parent
    color: "#344045"
    Text {
        id: heading
        text: "Flutter App"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.family: "Helvetica"
        font.pixelSize: flutter.width * 0.03
        font.bold: true
        color: "#FEFEFE"
    }
    Text {
        id: flutter_status_msg
        text: flutter_app.status_msg
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: heading.bottom
        anchors.topMargin: parent.height * 0.01
        font.family: "Helvetica"
        font.pixelSize: flutter.width * 0.01
        color: "#DDDDDD"
    }
    Button {
        id: flutter_button
        text: flutter_app.button
        anchors.top: flutter_status_msg.bottom
        anchors.topMargin: parent.height * 0.02
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: flutter_app.launch_or_stop()
        font.pixelSize: flutter.width * 0.015
        font.family: "Helvetica"
    }
}