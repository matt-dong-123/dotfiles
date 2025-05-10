return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = {},
        dim = {},
        indent = {},
        image = {},
        input = {},
        notifier = { timeout = 3000 },
        quickfile = {},
        scroll = { easing_function = 'quadratic' },
        statuscolumn = {},
        terminal = {},
        words = {},
        zen = {},
    },
    keys = {
        {
            '<leader>nh',
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
            '<leader>gl',
            function()
                Snacks.terminal.get 'lazygit'
            end,
            desc = 'Open Lazygit',
        },
        {
            'gz',
            function()
                Snacks.zen()
                Snacks.dim()
            end,
            desc = 'Zen Mode',
        },
    },
}
