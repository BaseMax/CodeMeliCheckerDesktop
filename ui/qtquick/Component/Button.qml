import QtQuick
import QtQuick.Templates as T
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

T.Button {
    id: control

    property string title: "Title"
    property bool isDefault: true
    property bool isBold: false

    property string setIcon: ""
    property string style: appStyle.backgroundItemActivated
    property string sizeType: "normal"

    implicitHeight: 40
    implicitWidth: textArea.width + 15

    text: title

    opacity: control.enabled ? 1.0 : 0.5

    background: Rectangle {
        id: textBackground
        implicitWidth: control.width
        implicitHeight: control.height
        Layout.fillWidth: true
        color: control.down ? !isDefault ? appStyle.primary : appStyle.backgroundItemFocused : !isDefault ? appStyle.primary : appStyle.backgroundItemActivated
        border.width: isDefault ? 1 : 0
        border.color: appStyle.borderActivated
        radius: 5
        opacity: enabled ? 1.0 : 0.3

        Behavior on color {
            ColorAnimation {
                duration: appStyle.duration
                easing.type: Easing.Linear
            }
        }
    }

    RowLayout {
        anchors.fill: parent

        Item {
            width: 0
        }

        Text {
            id: textArea
            text: control.text
            font.family: fontSystem.getContentFont.name
            font.pixelSize: appStyle.t1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            opacity: enabled ? 1.0 : 0.3
            color: isDefault ? appStyle.foregroundActivated : appStyle.accent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Item {
            width: 0
        }
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent
    }
}
