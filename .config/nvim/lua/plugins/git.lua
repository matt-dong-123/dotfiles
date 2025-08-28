return {
    {
        'folke/snacks.nvim',
        keys = {
            {
                '<leader>gB',
                function()
                    Snacks.gitbrowse.open()
                end,
                desc = 'Open in browser',
            },
            {
                '<leader>gb',
                function()
                    Snacks.git.blame_line()
                end,
                desc = 'Show blame',
            },
        },
    },
    {
        'lewis6991/gitsigns.nvim',
    },
}
