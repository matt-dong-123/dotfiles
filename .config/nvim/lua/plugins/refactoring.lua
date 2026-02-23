return {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    event = 'LspAttach',
    opts = {},
    keys = {
        {
            '<leader>Re',
            function()
                require('refactoring').refactor 'Extract Function'
            end,
            mode = 'x',
            desc = 'Extract Function',
        },
        {
            '<leader>Rv',
            function()
                require('refactoring').refactor 'Extract Variable'
            end,
            mode = 'x',
            desc = 'Extract Variable',
        },
        {
            '<leader>Ri',
            function()
                require('refactoring').refactor 'Inline Variable'
            end,
            mode = { 'n', 'x' },
            desc = 'Inline Variable',
        },
        {
            '<leader>Rb',
            function()
                require('refactoring').refactor 'Extract Block'
            end,
            desc = 'Extract Block',
        },
    },
}
