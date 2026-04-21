return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
        label = { style = 'inline' },
    },
    keys = {
        {
            '<leader>js',
            mode = { 'n', 'o', 'x' },
            function()
                require('flash').jump()
            end,
            desc = 'Flash',
        },
        {
            '<leader>jS',
            mode = { 'n', 'o', 'x' },
            function()
                require('flash').treesitter()
            end,
            desc = 'Flash Treesitter',
        },
        {
            '<leader>jr',
            mode = 'o',
            function()
                require('flash').remote()
            end,
            desc = 'Remote Flash',
        },
        {
            '<leader>jR',
            mode = { 'o', 'x' },
            function()
                require('flash').treesitter_search()
            end,
            desc = 'Treesitter Search',
        },
    },
}
