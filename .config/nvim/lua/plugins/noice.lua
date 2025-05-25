return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = true,
        },
    },
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
}
