return {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true, timeout = 3000 },
        quickfile = { enabled = true },
        scroll = {
            enabled = true,
            easing_function = 'quadratic',
        },
        statuscolumn = { enabled = true },
        terminal = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        {
            '<leader>dn',
            function()
                Snacks.notifier.hide()
            end,
            desc = 'Hide Notifications',
        },
        {
            '<leader>tf',
            function()
                Snacks.terminal()
            end,
            desc = 'Open Terminal',
        },
        {
            '<leader>lg',
            function()
                Snacks.terminal.get 'lazygit'
            end,
            desc = 'Open Lazygit',
        },
    },
}
