return {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        open_for_directories = true,
        yazi_floating_window_border = 'none',
        floating_window_scaling_factor = 1,
        yazi_floating_window_zindex = 200,
    },
    keys = {
        {
            '<leader>e',
            mode = { 'n', 'v' },
            '<cmd>Yazi<CR>',
            desc = 'Yazi',
        },
    },
}
