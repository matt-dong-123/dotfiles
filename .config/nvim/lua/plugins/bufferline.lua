return {
    'akinsho/bufferline.nvim',
    event = 'BufEnter',
    dependencies = 'nvim-mini/mini.nvim',
    opts = {
        options = {
            diagnostics = 'nvim_lsp',
            always_show_bufferline = false,
        },
    },
}
