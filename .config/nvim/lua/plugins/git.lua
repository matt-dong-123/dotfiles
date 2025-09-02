return {
    {
        'tpope/vim-fugitive',
        keys = {
            {
                '<leader>gc',
                '<cmd>Git commit<CR>',
                desc = 'Commit',
            },
            {
                '<leader>ga',
                '<cmd>Git add .<CR>',
                desc = 'Stage all',
            },
            {
                '<leader>gP',
                '<cmd>Git push<CR>',
                desc = 'Push',
            },
            {
                '<leader>gp',
                '<cmd>Git pull<CR>',
                desc = 'Pull',
            },
            {
                '<leader>gg',
                '<cmd>Git<CR>',
                desc = 'Open fugitive',
            },
            {
                '<leader>gn',
                '<cmd>Git checkout -b<CR>',
                desc = 'New Branch',
            },
            {
                '<leader>gi',
                '<cmd>Git init<CR>',
                desc = 'Initialize',
            },
        },
    },
    {
        'lewis6991/gitsigns.nvim',
    },
    {
        'folke/snacks.nvim',
        keys = {
            {
                '<leader>go',
                function()
                    Snacks.gitbrowse.open()
                end,
                desc = 'Open in browser',
            },
            {
                '<leader>gB',
                function()
                    Snacks.git.blame_line()
                end,
                desc = 'Show blame',
            },
            {
                '<leader>gb',
                function()
                    Snacks.picker.git_branches()
                end,
                desc = 'Branches',
            },
            {
                '<leader>gl',
                function()
                    Snacks.picker.git_log()
                end,
                desc = 'Log',
            },
            {
                '<leader>gL',
                function()
                    Snacks.picker.git_log_line()
                end,
                desc = 'Log Line',
            },
            {
                '<leader>gs',
                function()
                    Snacks.picker.git_status()
                end,
                desc = 'Status',
            },
            {
                '<leader>gS',
                function()
                    Snacks.picker.git_stash()
                end,
                desc = 'Stash',
            },
            {
                '<leader>gd',
                function()
                    Snacks.picker.git_diff()
                end,
                desc = 'Diff (Hunks)',
            },
            {
                '<leader>gf',
                function()
                    Snacks.picker.git_log_file()
                end,
                desc = 'Log File',
            },
        },
    },
}
