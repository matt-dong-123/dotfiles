return {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
        direction = 'float',
        shell = vim.o.shell,
        float_opts = {
            border = 'curved',
            winblend = 0,
            highlights = {
                border = 'Normal',
                background = 'Normal',
            },
        },
    },
    keys = {
        {
            '<leader>tf',
            '<cmd>ToggleTerm direction=float<cr>',
            desc = 'ToggleTerm float',
        },
        {
            '<leader>th',
            '<cmd>ToggleTerm size=10 direction=horizontal<cr>',
            desc = 'ToggleTerm horizontal split',
        },
        {
            '<leader>tv',
            '<cmd>ToggleTerm size=80 direction=vertical<cr>',
            desc = 'ToggleTerm vertical split',
        },
    },
}
