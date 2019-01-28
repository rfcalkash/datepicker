import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Button{
        anchors.centerIn: parent
        text: "Съешь меня"
        onClicked: {
            dp_dialog.open()
        }
    }
    Dialog{
        id: dp_dialog
        width: height
        height: parent.height
        contentItem: DatePicker{
            anchors.fill: parent
        }

    }
}
