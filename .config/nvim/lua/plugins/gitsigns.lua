return {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    opts = {},
    keys = {
        {
            '<leader>gp',
            function()
                require('gitsigns').preview_hunk()
            end,
            { desc = 'Preview Hunk' },
        },
        {
            '<leader>gd',
            function()
                require('gitsigns').diffthis()
            end,
            { desc = 'Show Diff' },
        },
    },
}
