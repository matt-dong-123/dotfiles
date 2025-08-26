return {
    'folke/lazydev.nvim',
    dependencies = {
        { 'DrKJeff16/wezterm-types', lazy = true },
    },
    ft = 'lua',
    opts = {
        library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            { path = 'snacks.nvim', words = { 'Snacks' } },
            { path = 'wezterm-types', words = { 'wezterm ' } },
        },
    },
}
