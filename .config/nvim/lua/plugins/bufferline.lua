return {
    'akinsho/bufferline.nvim',
    lazy = false,
    opts = {},
    keys = {
        {
            'gb',
            '<cmd>BufferLinePick<cr>',
            desc = 'Pick buffer',
        },
        {
            'gp',
            '<cmd>BufferLineTogglePin<cr>',
            desc = 'Toggle buffer pin',
        },
    },
}
