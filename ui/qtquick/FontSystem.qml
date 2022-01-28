import QtQuick

Item {

    property var getContentFont: contentFont
    property var getAwesomeSolid: fontAwesomeSolid
    property var getAwesomeBrand: fontAwesomeBrand

    FontLoader {
        id: fontAwesomeBrand
        source: "qrc:/assets/fonts/iconic/Font Awesome 5 Brands-Regular-400.otf"
    }

    FontLoader {
        id: fontAwesomeRegular
        source: "qrc:/assets/fonts/iconic/Font Awesome 5 Free-Regular-400.otf"
    }

    FontLoader {
        id: fontAwesomeSolid
        source: "qrc:/assets/fonts/iconic/Font Awesome 5 Free-Solid-900.otf"
    }

    FontLoader {
        id: contentFont
        source: "qrc:/assets/fonts/content/Samim-FD.ttf"
    }
}
