return {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'float',
        close_on_exit = true,
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
        { [[<C-Enter>]], desc = 'Toggle terminal' },
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
