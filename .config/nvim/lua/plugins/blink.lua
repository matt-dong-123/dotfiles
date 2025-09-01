return {
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
    version = '*',
    opts = {
        completion = {
            menu = {
                border = 'rounded',
            },
        },
        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer',
                'cmdline',
            },
        },
        cmdline = {
            enabled = true,
            completion = {
                menu = { auto_show = true },
            },
        },
    },
}
