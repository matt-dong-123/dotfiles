return {
    {
        'neovim/nvim-lspconfig',
        version = false,
        config = function()
            vim.lsp.enable {
                'bashls',
                'clangd',
                'lua_ls',
                'taplo',
                'pyright',
                'ruff',
            }
        end,
    },
    {
        'folke/snacks.nvim',
        keys = {
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
        },
    },
}
