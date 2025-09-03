return {
    {
        'OXY2DEV/markview.nvim',
        ft = 'markdown',
        priority = 49,
        dependencies = {
            'nvim-mini/mini.nvim',
        },
    },
    {
        'toppair/peek.nvim',
        ft = 'markdown',
        build = 'deno task --quiet build:fast',
        opts = {},
        keys = {
            {
                '<leader>np',
                function()
                    require('peek').open()
                end,
                desc = 'Open Preview',
            },
            {
                '<leader>nc',
                function()
                    require('peek').close()
                end,
                desc = 'Close Preview',
            },
        },
    },
}
