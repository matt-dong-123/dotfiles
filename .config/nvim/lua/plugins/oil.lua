return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    lazy = false,
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
