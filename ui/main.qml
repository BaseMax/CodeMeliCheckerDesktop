import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import App.IdCode.Interface 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Code-Meli Checker")

    IdCodeInterface { id: idCodeInterface; }

    Connections {
        target: idCodeInterface
        function onCodeChanged() {
            console.log("Result:" + idCodeInterface.code)
            console.log("Status:" + idCodeInterface.status)
        }
    }

    Column {
        anchors.centerIn: parent

        TextField {
            id: idCodeInput
        }

        Button {
            text: "Check"
            width: parent.width
            onClicked: {
                idCodeInterface.setCode(parseInt(idCodeInput.text))
            }
        }
    }
}
