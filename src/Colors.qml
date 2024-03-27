pragma Singleton

import QtQuick 2.15

QtObject {
    id: root

    property string themeName: "theme1"
    property color style_darkColor
    Behavior on style_darkColor { ColorAnimation {} }
    property color style_brightColor
    property color style_midDarkColor
    property color style_midBrightColor
    property color style_darkTextColor
    property color style_brightTextColor

    // this theme object hosts all the current color properties
    property var themes: ({})

    readonly property var theme1: {
        'themeName' : 'theme1',
        'style_darkColor': '#0d1b2a',
        'style_midDarkColor': '#1b263b',
        'style_midBrightColor': '#415a77',
        'style_brightColor': '#778da9',
        'style_darkTextColor': '#0d1b2a',
        'style_brightTextColor': '#778da9'
    }

    readonly property var theme2: {
        'themeName' : 'theme2',
        'style_darkColor': '#778da9',
        'style_midDarkColor': '#415a77',
        'style_midBrightColor': '#1b263b',
        'style_brightColor': '#0d1b2a',
        'style_darkTextColor': '#778da9',
        'style_brightTextColor': '#0d1b2a'
    }

    readonly property var theme3: {
        'themeName' : 'theme3',
        'style_darkColor': '#1F2544',
        'style_midDarkColor': '#474F7A',
        'style_midBrightColor': '#81689D',
        'style_brightColor': '#FFD0EC',
        'style_darkTextColor': '#1F2544',
        'style_brightTextColor': '#FFD0EC'
    }

    readonly property var theme4: {
        'themeName' : 'theme4',
        'style_darkColor': '#3E3232',
        'style_midDarkColor': '#503C3C',
        'style_midBrightColor': '#7E6363',
        'style_brightColor': '#A87C7C',
        'style_darkTextColor': '#3E3232',
        'style_brightTextColor': '#A87C7C'
    }

    readonly property var theme5: {
        'themeName' : 'theme5',
        'style_darkColor': '#030637',
        'style_midDarkColor': '#3C0753',
        'style_midBrightColor': '#720455',
        'style_brightColor': '#910A67',
        'style_darkTextColor': '#030637',
        'style_brightTextColor': '#910A67'
    }


    Component.onCompleted: {
        // fill the "themes" object
        for (var prop in root) {
            var theme = root[prop]
            if (theme instanceof Object && theme.themeName) {
                // theme is an object and features a "themeName" property (e.g theme1)
                themes[theme.themeName] = {}
                for(var i = 0; i < Object.keys(theme).length; ++i) {
                    var innerProp = Object.keys(theme)[i]
                    themes[theme.themeName][innerProp] = theme[innerProp]
                }
            }
        }
        root.setTheme(themes.theme1)
    }

    // set the provided theme as the current theme
    function setTheme(theme) {
        for(var i = 0; i < Object.keys(theme).length; ++i) {
            var th = Object.keys(theme)[i]
            var prop = theme[th]
            root[th] = prop
        }
    }

    // set the provided theme name as the current theme;
    // it actually calls the setTheme method
    function setThemeName(name) {
        for (var i in themes) {
            if (themes[i] === themes[name]) {
                setTheme(themes[name])
            }
        }
    }

    // return the currently set theme
    function getThemeName() {
        return themeName
    }
}
