return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'j-hui/fidget.nvim',
        },
    },
    {
        'mason-org/mason.nvim',
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
        version = '*',
        dependencies = { 'mason.nvim' },
        opts = {
            ensure_installed = {
                -- LSP
                'bashls',
                'clangd',
                'gopls',
                'pyright',
                'lua_ls',
                'harper_ls',
                'marksman',
                -- Formatters
                'stylua',
            },
        },
    },
}
