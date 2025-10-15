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
        {
            '<leader>go',
            function()
                Snacks.gitbrowse.open()
            end,
            desc = 'Open in browser',
        },
        {
            '<leader>gB',
            function()
                Snacks.git.blame_line()
            end,
            desc = 'Show blame',
        },
        {
            '<leader>gb',
            function()
                Snacks.picker.git_branches()
            end,
            desc = 'Branches',
        },
        {
            '<leader>gl',
            function()
                Snacks.picker.git_log()
            end,
            desc = 'Log',
        },
        {
            '<leader>gL',
            function()
                Snacks.picker.git_log_line()
            end,
            desc = 'Log Line',
        },
        {
            '<leader>gs',
            function()
                Snacks.picker.git_status()
            end,
            desc = 'Status',
        },
        {
            '<leader>gS',
            function()
                Snacks.picker.git_stash()
            end,
            desc = 'Stash',
        },
        {
            '<leader>gd',
            function()
                Snacks.picker.git_diff()
            end,
            desc = 'Diff (Hunks)',
        },
        {
            '<leader>gf',
            function()
                Snacks.picker.git_log_file()
            end,
            desc = 'Log File',
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
