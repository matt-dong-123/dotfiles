return {
    'folke/trouble.nvim',
    opts = {},
    keys = {
        {
            '<leader>xq',
            '<cmd>Trouble diagnostics toggle<cr>',
            desc = 'Diagnostics',
        },
        {
            '<leader>xb',
            '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
            desc = 'Buffer Diagnostics',
        },
        {
            '<leader>xs',
            '<cmd>Trouble symbols toggle focus=false<cr>',
            desc = 'Symbols',
        },
        {
            '<leader>xl',
            '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
            desc = 'LSP Definitions / references / ...',
        },
        {
            '<leader>xL',
            '<cmd>Trouble loclist toggle<cr>',
            desc = 'Location List',
        },
        {
            '<leader>xQ',
            '<cmd>Trouble qflist toggle<cr>',
            desc = 'Quickfix List',
        },
    },
}
