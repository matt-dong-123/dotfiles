return {
    {
        'neovim/nvim-lspconfig',
        version = '*',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                -- LSPs
                'bashls',
                'clangd',
                'gopls',
                'lua_ls',
                'marksman',
                -- Formatters and Linters
                'shfmt',
                'shellcheck',
                'cpplint',
                'gofumpt',
                'staticcheck',
                'stylua',
                'selene',
                'markdownlint',
                'taplo',
            },
        },
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
