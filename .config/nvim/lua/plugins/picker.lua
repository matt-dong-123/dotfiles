return {
    'folke/snacks.nvim',
    dependencies = {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
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
            '<leader>ld',
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = 'Definition',
        },
        {
            '<leader>lD',
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = 'Declaration',
        },
        {
            '<leader>lr',
            function()
                Snacks.picker.lsp_references()
            end,
            desc = 'References',
        },
        {
            '<leader>li',
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = 'Implementations',
        },
        {
            '<leader>lt',
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = 'Type Definitions',
        },
        {
            '<leader>ls',
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = 'Document Symbols',
        },
        {
            '<leader>lS',
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = 'Workspace Symbols',
        },
        -- git
        {
            '<leader>gb',
            function()
                Snacks.picker.git_branches()
            end,
            desc = 'Branches',
        },
        {
            '<leader>gl',
            function()
                Snacks.picker.git_log()
            end,
            desc = 'Log',
        },
        {
            '<leader>gL',
            function()
                Snacks.picker.git_log_line()
            end,
            desc = 'Log Line',
        },
        {
            '<leader>gs',
            function()
                Snacks.picker.git_status()
            end,
            desc = 'Status',
        },
        {
            '<leader>gS',
            function()
                Snacks.picker.git_stash()
            end,
            desc = 'Stash',
        },
        {
            '<leader>gd',
            function()
                Snacks.picker.git_diff()
            end,
            desc = 'Diff (Hunks)',
        },
        {
            '<leader>gf',
            function()
                Snacks.picker.git_log_file()
            end,
            desc = 'Log File',
        },
    },
}
