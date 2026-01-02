return {
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        opts = {
            dependencies_bin = {
                ['tinymist'] = '/opt/homebrew/bin/tinymist',
                ['websocat'] = '/opt/homebrew/bin/websocat',
            },
        },
    },
    {
        'hakonharnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {},
        keys = {
            { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste Image' },
        },
    },
}
