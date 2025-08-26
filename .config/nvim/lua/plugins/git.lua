return {
    {
        'tpope/vim-fugitive',
    },
    {
        'tpope/vim-rhubarb',
        lazy = false,
        keys = {
            { '<leader>gb', ':GBrowse<CR>', desc = 'Open in browser' },
        },
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
