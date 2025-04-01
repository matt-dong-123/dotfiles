return {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
    version = '1.*',
    opts = {
        keymap = { preset = 'default' },
        appearance = {
            nerd_font_variant = 'mono',
        },
        completion = {
            menu = {
                border = 'rounded',
            },
            ghost_text = {
                enabled = true,
            },
            documentation = {
                auto_show = true,
            },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'cmdline' },
        },
        signature = {
            enabled = true,
        },
        cmdline = {
            enabled = true,
            keymap = { preset = 'cmdline' },
            sources = function()
                local type = vim.fn.getcmdtype()
                if type == '/' or type == '?' then
                    return { 'buffer' }
                end
                if type == ':' or type == '@' then
                    return { 'cmdline' }
                end
                return {}
            end,
            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    },
                },
                menu = { auto_show = true },
                ghost_text = { enabled = true },
            },
        },
        fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
}
