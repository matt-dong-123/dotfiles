return {
    'saghen/blink.cmp',
    -- OPTIONAL:
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
        keymap = { preset = 'default' },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono',
        },
        signature = { enabled = true },
    },
    sources = {
        completion = {
            enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    },
}
