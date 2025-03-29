return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
        lsp = {
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_mardown'] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = true,
        },
    },
    dependencies = {
        'MunifTanjim/nui.nvim',
        -- OPTIONAL:
        'rcarriga/nvim-notify',
    },
}
