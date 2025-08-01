return {
    'folke/which-key.nvim',
    opts = {
        preset = 'helix',
        spec = {
            {
                mode = { 'n', 'v' },
                { '<leader>f', group = 'Find', icon = '' },
                { '<leader>h', group = 'Hide', icon = '' },
                { '<leader>s', group = 'Splits', icon = '' },
                { '<leader>g', group = 'Git', icon = '' },
                { '<leader>n', group = 'Notes', icon = '' },
                { '<leader>o', group = 'Org', icon = '󰸗' },
                { '<leader>x', group = 'Trouble', icon = '' },
                { '<leader>t', group = 'Terminal', icon = '' },
                { '<leader>w', icon = '' },
                { '<leader>e', icon = '' },
                { '<leader>E', icon = '' },
                { '<leader>r', icon = '' },
                { '<leader>t', icon = '' },
                { '<leader>u', icon = '', desc = 'Toggle undotree' },
                { '<leader>z', icon = '󰼀' },
                { '<leader>+', icon = '' },
                { '<leader>-', icon = '' },
            },
        },
    },
}
