return {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true, timeout = 3000 },
        quickfile = { enabled = true },
        scroll = {
            enabled = true,
            easing_function = 'quadratic',
        },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        {
            '<leader>lg',
            function()
                Snacks.lazygit()
            end,
            desc = 'Lazygit',
        },
        {
            '<leader>dn',
            function()
                Snacks.notifier.hide()
            end,
            desc = 'Hide Notifications',
        },
    },
}
