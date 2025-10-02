return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        preset = 'helix',
        spec = {
            {
                mode = { 'n', 'v' },
                { '<leader>f', group = 'Find', icon = '' },
                { '<leader>h', group = 'Hide', icon = '' },
                { '<leader>s', group = 'Splits', icon = '' },
                { '<leader>g', group = 'Git', icon = '' },
                { '<leader>n', group = 'Notes', icon = '' },
                { '<leader>l', group = 'LSP', icon = '' },
                { '<leader>x', group = 'Trouble', icon = '' },
                { '<leader>w', icon = '' },
                { '<leader>q', icon = '' },
                { '<leader>e', icon = '' },
                { '<leader>r', icon = '' },
                { '<leader>u', icon = '' },
            },
        },
    },
}
