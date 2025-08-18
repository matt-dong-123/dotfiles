return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = {},
        gitbrowse = {},
        indent = {},
        input = {},
        notifier = { timeout = 3000, style = 'fancy' },
        quickfile = {},
        scroll = { easing_function = 'quadratic' },
        statuscolumn = {},
        terminal = {},
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
            '<leader>gl',
            function()
                Snacks.terminal.get 'lazygit'
            end,
            desc = 'Open Lazygit',
        },
        {
            '<leader>gb',
            function()
                Snacks.gitbrowse()
            end,
            desc = 'Open in remote repo',
        },
        {
            '<leader>t',
            function()
                Snacks.terminal.toggle()
            end,
            desc = 'Open terminal',
        },
    },
}
