import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import App.IdCode.Interface 1.0

import "./Component" as Controls

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("بررسی کد ملی")

    color: appStyle.pageground

    LayoutMirroring.enabled: appRootObjects.isLeftToRight ? false : true
    LayoutMirroring.childrenInherit: appRootObjects.isLeftToRight ? false : true

    QtObject {
        id: appRootObjects
        property bool desktopMode: true
        property bool isLeftToRight: true
    }

    QtObject {
        id: appStyle

        property color primary: "#176eff"
        property color accent: "#ffffff"
        property color pageground: "#14213d"
        property color backgroundItemActivated: "#176eff"
        property color backgroundItemFocused: "#3277e9"
        property color backgroundItemHovered: "#176eff"
        property color backgroundItemDeactivated: "#176eff"
        property color foregroundActivated: "#ffffff"
        property color foregroundDeactivated: "#f2f2f2"
        property color foregroundFocused: "#ffffff"
        property color foregroundHovered: "#ffffff"
        property color borderActivated: "#223254"
        property color borderFocused: "#3277e9"

        property color error: "#e5383b"
        property color success: "#0a9396"

        property int duration: 200
        property int display: 96
        property int h5: 18
        property int h6: 16
        property int t1: 14
        property int t2: 12
        property int paragraph: 14

        property int radius: 5
    }

    FontSystem {
        id: fontSystem
    }

    IdCodeInterface {
        id: codeInterface
    }

    Connections {
        id: codeConnection
        target: codeInterface
        function onStatusChanged() {
            messageIcon.visible = true
        }
    }

    Item {
        width: parent.width / 2
        height: parent.height / 2
        anchors.centerIn: parent

        ColumnLayout {

            anchors.fill: parent

            Controls.VerticalSpacer {}

            Text {
                id: messageIcon
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.family: fontSystem.getAwesomeSolid.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: appStyle.display
                font.bold: true
                font.weight: Font.Bold
                color: codeInterface.status ? appStyle.success : appStyle.error
                text: codeInterface.status ? "\uf058" : "\uf00d"
                renderType: Text.NativeRendering
                visible: false
            }

            Text {
                id: messageText
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.family: fontSystem.getContentFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: appStyle.h6
                color: codeInterface.status ? appStyle.success : appStyle.error
                text: codeInterface.status ? "کد ملی معتبر است!" : "کد ملی معتبر نیست!"
                renderType: Text.NativeRendering
            }

            Item {
                height: 5
            }

            Controls.TextInput {
                id: codeInput
                classicTitle: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                placeHolder: "کد ملی را وارد کنید"
                options.validator: RegularExpressionValidator {
                    regularExpression: /[0-9]{0,10}+/
                }
            }

            Item {
                height: 5
            }

            Controls.Button {
                width: parent.width
                Layout.fillWidth: true
                text: "بررسی"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: {
                    codeInterface.setIdCode(codeInput.value)
                }
            }

            Controls.VerticalSpacer {}
        }
    }
}
