return {
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        opts = {
            dependencies_bin = {
                ['tinymist'] = vim.fn.exepath 'tinymist',
                ['websocat'] = vim.fn.exepath 'websocat',
            },
        },
    },
    {
        'hakonharnes/img-clip.nvim',
        event = 'VeryLazy',
        ft = 'typst',
        opts = {},
        keys = {
            { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste Image' },
        },
    },
}
