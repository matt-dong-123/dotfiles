return {
    'akinsho/bufferline.nvim',
    event = 'BufReadPre',
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
