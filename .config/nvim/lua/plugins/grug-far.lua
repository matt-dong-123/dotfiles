return {
    'MagicDuck/grug-far.nvim',
    opts = {},
    cmd = { 'GrugFar', 'GrugFarWithin' },
    keys = {
        {
            '<leader>fr',
            function()
                require('grug-far').open { prefills = { search = vim.fn.expand '<cword>' } }
            end,
            desc = 'Replace',
        },
    },
}
