return {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-mini/mini.nvim',
    opts = {
        options = {
            diagnostics = 'nvim_lsp',
            always_show_bufferline = false,
        },
    },
}
