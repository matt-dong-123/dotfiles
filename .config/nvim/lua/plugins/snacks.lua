return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = {},
        git = {},
        gitbrowse = {},
        indent = {},
        input = {},
        notifier = { timeout = 3000, style = 'fancy' },
        quickfile = {},
        scroll = { easing_function = 'quadratic' },
        statuscolumn = {},
        words = {},
    },
    keys = {
        {
            '<leader>hn',
            function()
                Snacks.notifier.hide()
            end,
            desc = 'Notifications',
        },
        {
            '<leader>gb',
            function()
                Snacks.gitbrowse()
            end,
            desc = 'Open in remote repo',
        },
        {
            '<leader>gb',
            function()
                Snacks.git.blame_line()
            end,
            desc = 'Show blame',
        },
    },
}
