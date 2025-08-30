return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'folke/lazydev.nvim',
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
                'lazydev',
                'lsp',
                'path',
                'snippets',
                'buffer',
                'cmdline',
            },
            providers = {
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    -- make it top priority
                    score_offset = 100,
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
