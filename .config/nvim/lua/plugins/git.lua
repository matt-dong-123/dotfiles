return {
    {
        'tpope/vim-fugitive',
    },
    {
        'tpope/vim-rhubarb',
    },
    {
        'lewis6991/gitsigns.nvim',
        keys = {
            {
                '<leader>gh',
                function()
                    require('gitsigns').preview_hunk()
                end,
                desc = 'Preview Hunk',
            },
        },
    },
}
