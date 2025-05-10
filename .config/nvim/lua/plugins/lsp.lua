return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            'j-hui/fidget.nvim',
            'mason-org/mason-lspconfig.nvim',
            'mason-org/mason.nvim',
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
        event = { 'BufReadPre', 'BufNewFile' },
        version = '*',
        dependencies = { 'mason.nvim' },
        opts = {
            ensure_installed = {
                'bashls',
                'clangd',
                'gopls',
                'pyright',
                'lua_ls',
                'marksman',
            },
        },
    },
}
