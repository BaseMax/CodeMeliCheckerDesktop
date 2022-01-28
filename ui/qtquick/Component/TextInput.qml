import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import QtQuick.Templates as T

ColumnLayout {

    property string title;
    property string icon : "";
    property string note;
    property alias value : control.text;
    property string placeHolder;
    property string alertType;
    property bool classicTitle : false
    property bool hasVisibleCheck : false

    QtObject {
        id: internalOptions
        property bool hidden : false;
    }

    property bool isValid : false

    property var digit

    function toLatinDigits(s){
        var a=["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"]
        var p=["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]
        for(var i=0;i<10;i++){
            s=replaceAll(s, a[i], i);
            s=replaceAll(s, p[i], i);
        }
        return s;
    }

    //replaceFunction
    function replaceAll(str, find, replace) {
        return str.replace(new RegExp(find, 'g'), replace);
    }

    //Fix number function
    function fixNumber(value){
        var separator=",";
        value=toLatinDigits(value.toString());
        value=replaceAll(value, separator, "");
        return value.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1"+separator);
    }

    property alias options  : control

    signal editCompleted;

    Layout.fillWidth: true;

    spacing: 2

    Item { height: 1; }

    RowLayout {

        width: parent.width
        Layout.fillWidth: true
        visible: classicTitle

        Item { width: 1; }

        Text {
            text: title
            font.family: fontSystem.getContentFont.name
            Layout.fillWidth: false;
            font.pixelSize: appStyle.t1
            color: appStyle.foregroundDeactivated
        }

        Item { width: 1; }
    }


    // Control
    T.TextField {
        id:control
        height: 32
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        topPadding: classicTitle ? 7 : 0
        Layout.fillWidth: true;
        font.family: fontSystem.getContentFont.name
        font.pixelSize: appStyle.paragraph
        placeholderText: placeHolder
        cursorVisible: activeFocus
        color: appStyle.accent
        selectByMouse: appRootObjects.desktopMode ? true : false
        //horizontalAlignment: !appRootObjects.isLeftToRight ? Text.AlignLeft : Text.AlignRight
        horizontalAlignment: Text.Center
        selectedTextColor: appStyle.accent
        selectionColor: appStyle.primary

        onAccepted: {
            control.focus = false
        }


        placeholderTextColor: appStyle.foregroundDeactivated

        background: Rectangle {
            id:back
            color: !classicTitle ? "transparent" : appStyle.pageground
            height: 36
            implicitHeight: 36
            radius: classicTitle ? 5 : 0
            border.width: classicTitle ? 1 : 0
            border.color: classicTitle ? appStyle.borderActivated : "transparent"
        }
    }


    Rectangle {
        width: parent.width
        Layout.fillWidth: true
        height: 1
        color: control.focus ? appStyle.borderFocused :  appStyle.borderActivated
        visible: !classicTitle
        Behavior on color {
            ColorAnimation {
                duration: 200
            }
        }
    }


}
