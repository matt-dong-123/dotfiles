return {
    {
        'olimorris/codecompanion.nvim',
        opts = {},
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-lua/plenary.nvim',
        },
    },
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        opts = {},
    },
    {
        'saghen/blink.cmp',
        opts = {
            sources = {
                per_filetype = {
                    codecompanion = { 'codecompanion' },
                },
            },
        },
    },
}
