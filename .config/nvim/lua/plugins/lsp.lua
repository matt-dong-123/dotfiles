return {
    {
        'neovim/nvim-lspconfig',
        version = false,
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        event = 'VeryLazy',
        opts = {
            ensure_installed = {
                -- LSPs
                'bashls',
                'clangd',
                'gopls',
                'lua_ls',
                'marksman',
                'taplo',
                -- Formatters and Linters
                'shfmt',
                'gofumpt',
                'stylua',
            },
        },
    },
    {
        'mason-org/mason.nvim',
        version = false,
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
        version = false,
        dependencies = { 'mason.nvim' },
        opts = {
            ensure_installed = {},
        },
    },
}
