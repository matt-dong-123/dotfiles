return {
    'MagicDuck/grug-far.nvim',
    opts = {},
    cmd = { 'GrugFar', 'GrugFarWithin' },
    keys = {
        {
            '<leader>fr',
            function()
                require('grug-far').open()
            end,
            desc = 'Replace',
        },
    },
}
