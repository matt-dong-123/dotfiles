return {
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'rafamadriz/friendly-snippets',
        'copilot.lua',
        'fang2hou/blink-copilot',
    },
    version = '*',
    opts = {
        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer',
                'copilot',
                'cmdline',
            },
            providers = {
                copilot = {
                    name = 'copilot',
                    module = 'blink-copilot',
                    async = true,
                    opts = {
                        max_completions = 3,
                    },
                },
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
