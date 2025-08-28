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
}
