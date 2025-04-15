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
            desc = '[T]erminal [F]loat',
        },
        {
            '<leader>th',
            '<cmd>ToggleTerm size=10 direction=horizontal<cr>',
            desc = '[T]erminal [H]orizontal split',
        },
        {
            '<leader>tv',
            '<cmd>ToggleTerm size=80 direction=vertical<cr>',
            desc = '[T]erminal [V]ertical split',
        },
        {
            '<leader>lg',
            [[
                <cmd>lua require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true }):toggle()<CR>'
            ]],
            desc = '[L]azy[G]it',
        },
    },
}
