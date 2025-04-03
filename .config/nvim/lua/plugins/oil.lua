return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {
        default_file_explorer = true,
        columns = {
            'icon',
        },
        view_options = {
            show_hidden = true,
            is_hidden_file = function(name, bufnr)
                return name ~= '..' and vim.startswith(name, '.')
            end,
        },
    },
    keys = {
        {
            '<leader>e',
            '<cmd>Oil<CR>',
            desc = 'Open oil at current file',
        },
    },
}
