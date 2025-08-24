return {
    'NeogitOrg/neogit',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'folke/snacks.nvim',
        {
            'sindrets/diffview.nvim',
            keys = {
                {
                    '<leader>gd',
                    ':DiffviewOpen<CR>',
                    desc = 'View Diff',
                },
                {
                    '<leader>gD',
                    ':DiffviewClose<CR>',
                    desc = 'Close Diff',
                },
            },
        },
    },
    opts = {
        integrations = {
            diffview = true,
            snacks = true,
        },
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
