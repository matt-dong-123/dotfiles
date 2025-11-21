return {
    'snacks.nvim',
    dependencies = {
        'folke/todo-comments.nvim',
        opts = {},
        keys = {
            {
                '<leader>fT',
                function()
                    ---@diagnostic disable-next-line: undefined-field
                    Snacks.picker.todo_comments()
                end,
                desc = 'Todo',
            },
        },
    },
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
            desc = 'Files',
        },
        {
            '<leader>f.',
            function()
                Snacks.picker.smart { cwd = '~/dotfiles' }
            end,
            desc = 'In dotfiles',
        },
        {
            '<leader>fc',
            function()
                Snacks.picker.smart { cwd = '~/dotfiles/.config/nvim' }
            end,
            desc = 'In nvim config',
        },
        {
            '<leader>fn',
            function()
                Snacks.picker.smart { cwd = '~/notes' }
            end,
            desc = 'In notes',
        },
        {
            '<leader>fh',
            function()
                Snacks.picker.help()
            end,
            desc = 'Help',
        },
        {
            '<leader>fk',
            function()
                Snacks.picker.keymaps()
            end,
            desc = 'Keymaps',
        },
        {
            '<leader>fg',
            function()
                Snacks.picker.grep {
                    hidden = true,
                }
            end,
            desc = 'Text',
        },
        {
            '<leader>fb',
            function()
                Snacks.picker.buffers()
            end,
            desc = 'Buffers',
        },
        {
            '<leader>fs',
            function()
                Snacks.picker.spelling()
            end,
            desc = 'Spelling',
        },
        {
            '<leader>fd',
            function()
                Snacks.picker.diagnostics()
            end,
            desc = 'Diagnostics (Project)',
        },
        {
            '<leader>fp',
            function()
                Snacks.picker.picker_actions()
            end,
            desc = 'Picker actions',
        },
    },
}
