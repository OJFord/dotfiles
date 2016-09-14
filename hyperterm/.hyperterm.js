module.exports = {
    config: {
        fontSize: 11,
        fontFamily: '"Anonymous Pro for Powerline"',
        cursorColor: '#839496',
        backgroundColor: '#002b36',
        foregroundColor: '#839496',
        borderColor: '#073642',
        css: `
            .t_tab.t_active:before,
            .tab_tab.tab_active:before {
                border-color: #002b36 !important;
            }
        `,
        termCss: '',
        colors: [
            '#073642',
            '#dc322f',
            '#859900',
            '#b58900',
            '#268db2',
            '#d33682',
            '#2aa198',
            '#eee8d5',
            '#002b36',
            '#cb4b16',
            '#586e75',
            '#657b83',
            '#839496',
            '#6c71c4',
            '#93a1a1',
            '#fdf6e3'
        ]
    },
    plugins: [],
    localPlugins: [],
    shell: '/usr/local/bin/xonsh'
};
