return {
    'folke/snacks.nvim',
    opts = {
        picker = {
            matcher = {
                frecency = true,
            },
        },
    },
    keys = {
        {
            '<leader>ff',
            function()
                Snacks.picker.smart()
            end,
            desc = 'Smart pick files',
        },
        {
            '<leader>fd',
            function()
                Snacks.picker.smart { cwd = '~/dotfiles' }
            end,
            desc = 'Open dotfiles',
        },
        {
            '<leader>fc',
            function()
                Snacks.picker.smart { cwd = '~/dotfiles/.config/nvim' }
            end,
            desc = 'Open nvim config',
        },
        {
            '<leader>fh',
            function()
                Snacks.picker.help()
            end,
            desc = 'Find help',
        },
        {
            '<leader>fk',
            function()
                Snacks.picker.keymaps()
            end,
            desc = 'Find keymaps',
        },
        {
            '<leader>ft',
            function()
                Snacks.picker.grep()
            end,
            desc = 'Grep all files in project',
        },
        {
            '<leader>fb',
            function()
                Snacks.picker.buffers()
            end,
            desc = 'Switch buffers',
        },
    },
}
