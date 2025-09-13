return {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        open_for_directories = true,
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
