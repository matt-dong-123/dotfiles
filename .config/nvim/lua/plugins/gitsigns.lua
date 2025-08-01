return {
    'lewis6991/gitsigns.nvim',
    keys = {
        {
            '<leader>gp',
            function()
                require('gitsigns').preview_hunk()
            end,
            desc = 'Preview Hunk',
        },
        {
            '<leader>gd',
            function()
                require('gitsigns').diffthis()
            end,
            desc = 'Show Diff',
        },
        {
            '<leader>gb',
            function()
                require('gitsigns').toggle_current_line_blame()
            end,
            desc = 'Toggle Blame',
        },
    },
}
