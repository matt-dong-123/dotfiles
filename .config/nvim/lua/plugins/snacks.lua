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
        toggle = { which_key = true },
        words = {},
    },
    keys = {
        {
            '<leader>tn',
            function()
                Snacks.notifier.hide()
            end,
            desc = 'Hide Notifications',
        },
    },
    init = function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'VeryLazy',
            callback = function()
                Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>ts'
            end,
        })
    end,
}
