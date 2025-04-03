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
    },
}
