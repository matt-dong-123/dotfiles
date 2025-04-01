return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
        {
            '<leader>/',
            function()
                require('flash').jump {
                    search = {
                        forward = true,
                        wrap = false,
                        multi_window = false,
                    },
                }
            end,
        },
        {
            '<leader>?',
            function()
                require('flash').jump {
                    search = {
                        forward = false,
                        wrap = false,
                        multi_window = false,
                    },
                }
            end,
        },
    },
}
