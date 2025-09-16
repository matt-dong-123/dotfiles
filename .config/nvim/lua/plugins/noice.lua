return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },
        lsp = {
            signature = {
                auto_open = {
                    enabled = false,
                },
            },
        },
    },
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
}
