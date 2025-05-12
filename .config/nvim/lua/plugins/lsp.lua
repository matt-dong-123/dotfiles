return {
    {
        'neovim/nvim-lspconfig',
        version = '*',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            'j-hui/fidget.nvim',
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        config = function()
            local ensure_installed = {
                'bashls',
                'clangd',
                'gopls',
                'pyright',
                'lua_ls',
                'marksman',
                'stylua',
                'luacheck',
            }
            require('mason-tool-installer').setup {
                ensure_installed = ensure_installed,
            }
        end,
    },
    {
        'mason-org/mason.nvim',
        version = '*',
        opts = {
            ui = {
                icons = {
                    package_installed = ' ',
                    package_pending = ' ',
                    package_uninstalled = ' ',
                },
            },
        },
        cmd = {
            'Mason',
            'MasonInstall',
            'MasonUninstall',
            'MasonUpdate',
            'MasonUninstallAll',
            'MasonLog',
        },
    },
    {
        'mason-org/mason-lspconfig.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        version = '*',
        dependencies = { 'mason.nvim' },
        opts = {
            ensure_installed = {},
        },
    },
}
