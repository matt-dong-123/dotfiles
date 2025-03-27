return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
    },
    keys = {
        {
            '<leader>gp',
            ':Gitsigns preview_hunk<CR>',
            desc = '[G]itsigns [P]review',
        },
    },
}
