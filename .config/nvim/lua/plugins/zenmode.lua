return {
    {
        'folke/zen-mode.nvim',
        opts = {
            plugins = {
                tmux = {
                    enabled = true,
                },
            },
        },
        keys = {
            {
                'gz',
                '<cmd>ZenMode<cr>',
                desc = 'Toggle Zen Mode',
            },
        },
    },
}
