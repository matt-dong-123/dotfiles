return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
        label = { style = 'inline' },
    },
    keys = {
        {
            'gs',
            mode = { 'n', 'o', 'x' },
            function()
                require('flash').jump()
            end,
            desc = 'Flash',
        },
        {
            'gS',
            mode = { 'n', 'o', 'x' },
            function()
                require('flash').treesitter()
            end,
            desc = 'Flash Treesitter',
        },
        {
            'gr',
            mode = 'o',
            function()
                require('flash').remote()
            end,
            desc = 'Remote Flash',
        },
        {
            'gR',
            mode = { 'o', 'x' },
            function()
                require('flash').treesitter_search()
            end,
            desc = 'Treesitter Search',
        },
    },
}
