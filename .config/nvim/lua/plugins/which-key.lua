return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        preset = 'helix',
        spec = {
            {
                mode = { 'n', 'v' },
                { '<leader>f', group = 'Find', icon = '' },
                { '<leader>s', group = 'Splits', icon = '' },
                { '<leader>g', group = 'Git', icon = '' },
                { '<leader>n', group = 'Notes', icon = '' },
                { '<leader>x', group = 'Trouble', icon = '' },
                { '<leader>t', group = 'Terminal', icon = '' },
            },
        },
    },
}
