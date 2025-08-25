return {
    'NeogitOrg/neogit',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'folke/snacks.nvim',
    },
    opts = {
        kind = 'floating',
        disable_line_numbers = false,
    },
    keys = {
        {
            '<leader>gg',
            ':Neogit<CR>',
            desc = 'Open Neogit (fullscreen)',
        },
        {
            '<leader>gs',
            ':Neogit kind=split<CR>',
            desc = 'Open Neogit (split)',
        },
        {
            '<leader>gl',
            ':Neogit log<CR>',
            desc = 'Log',
        },
        {
            '<leader>gp',
            ':Neogit pull<CR>',
            desc = 'Pull',
        },
        {
            '<leader>gP',
            ':Neogit push<CR>',
            desc = 'Push',
        },
    },
}
