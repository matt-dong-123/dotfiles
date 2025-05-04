return {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
        bigfile = {},
        indent = {},
        image = {},
        input = {},
        notifier = { timeout = 3000 },
        quickfile = {},
        scroll = { easing_function = 'quadratic' },
        statuscolumn = {},
        terminal = {},
        words = {},
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
