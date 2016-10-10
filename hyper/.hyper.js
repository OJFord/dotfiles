module.exports = {
    config: {
        bell: false,
        backgroundColor: '#1c1c1c',
        foregroundColor: '#8a8a8a',
        cursorColor: '#c7c7c7',
        colors: {
            black: '#586e75',
            lightBlack: '#839496',
            white: '#ffffd7',
            lightWhite: '#e4e4e4',
            red: 'd75f00',
            lightRed: '#d70000',
            green: '#5f8700',
            lightGreen: '#859900',
            blue: '#268bd2',
            lightBlue: '#0087ff',
            magenta: '#5f5faf',
            lightMagenta: '#6c71c4',
            yellow: '#b58900',
            lightYellow: '#af8700',
            cyan: '#2aa198',
            lightCyan: '#00afaf',
        },
        css: `
            .tab_active {
                background-color: #2c2c2c;
                border-color: #acacac !important;
            }
        `,
        fontFamily: 'Anonymous Pro for Powerline, monospace',
        fontSize: 11,
        padding: "0px 0px",
        termCss: ``,
        windowSize: [810, 500],
    },
    plugins: [],
    localPlugins: [],
    shell: '/usr/local/bin/xonsh',
};
