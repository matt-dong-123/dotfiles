return {
    'stevearc/oil.nvim',
    opts = {
        view_options = {
            show_hidden = true,
            is_hidden_file = function(name, bufnr)
                return name ~= '..' and vim.startswith(name, '.')
            end,
        },
    },
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    default_file_explorer = true,
    columns = {
        'icon',
    },
    keys = {
        {
            '<leader>e',
            '<cmd>Oil --float<CR>',
            desc = 'Open oil at current file',
        },
    },
}
