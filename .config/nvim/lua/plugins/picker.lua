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
            '<leader>fp',
            function()
                Snacks.picker.grep()
            end,
            desc = 'Files in project',
        },
        {
            '<leader>fb',
            function()
                Snacks.picker.buffers()
            end,
            desc = 'Buffers',
        },
        {
            '<leader>fd',
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = 'Definition',
        },
        {
            '<leader>fD',
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = 'Declaration',
        },
        {
            '<leader>fr',
            function()
                Snacks.picker.lsp_references()
            end,
            desc = 'References',
        },
        {
            '<leader>fi',
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = 'Implementations',
        },
        {
            '<leader>ft',
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = 'Type Definitions',
        },
        {
            '<leader>fs',
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = 'Document Symbols',
        },
        {
            '<leader>fs',
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = 'Workspace Symbols',
        },
    },
}
