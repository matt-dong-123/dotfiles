return {
    'olimorris/codecompanion.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        {
            'zbirenbaum/copilot.lua',
            opts = {},
        },
        {
            'OXY2DEV/markview.nvim',
            opts = {
                preview = {
                    filetypes = { 'markdown', 'codecompanion' },
                    ignore_buftypes = {},
                },
            },
        },
    },
}
