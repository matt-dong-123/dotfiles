return {
    'snacks.nvim',
    opts = {
        dashboard = {
            preset = {
                header = 'Welcome to neovim. Now do something:',
                keys = {
                    {
                        icon = '',
                        key = 'f',
                        desc = 'files',
                        action = ":lua Snacks.dashboard.pick('smart')",
                    },
                    {
                        icon = '',
                        key = 'r',
                        desc = 'recent',
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = '',
                        key = 'g',
                        desc = 'grep',
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = '',
                        key = 'c',
                        desc = 'config',
                        action = ":lua Snacks.dashboard.pick('smart', {cwd = vim.fn.stdpath('config')})",
                    },
                    {
                        icon = '',
                        key = 'n',
                        desc = 'notes',
                        action = ":lua Snacks.dashboard.pick('smart', {cwd = vim.fn.expand('$HOME/notes')})",
                    },
                    {
                        icon = '󰒲',
                        key = 'l',
                        desc = 'lazy',
                        action = ':Lazy',
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = ' ', key = 'q', desc = 'quit', action = ':qa' },
                },
            },
            sections = {
                { section = 'header' },
                {
                    section = 'keys',
                    gap = 1,
                    padding = 1,
                },
            },
        },
    },
}
