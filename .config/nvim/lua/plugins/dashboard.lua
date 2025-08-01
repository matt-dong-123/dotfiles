return {
    'folke/snacks.nvim',
    event = 'VeryLazy',
    opts = {
        dashboard = {
            preset = {
                keys = {
                    {
                        icon = ' ',
                        key = 'f',
                        desc = 'Find File',
                        action = ":lua Snacks.dashboard.pick('smart')",
                    },
                    {
                        icon = ' ',
                        key = 'r',
                        desc = 'Recent Files',
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = ' ',
                        key = 'c',
                        desc = 'Config',
                        action = ":lua Snacks.dashboard.pick('smart', {cwd = vim.fn.stdpath('config')})",
                    },
                    {
                        icon = ' ',
                        key = 'n',
                        desc = 'Notes',
                        action = ":lua Snacks.dashboard.pick('smart', {cwd = vim.fn.expand('$HOME/Notes')})",
                    },
                    {
                        icon = '󰒲 ',
                        key = 'l',
                        desc = 'Lazy',
                        action = ':Lazy',
                        enabled = package.loaded.lazy ~= nil,
                    },
                    {
                        icon = ' ',
                        key = 'm',
                        desc = 'Mason',
                        action = ':Mason',
                    },
                    { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
                },
            },
            sections = {
                { section = 'header' },
                {
                    section = 'keys',
                    gap = 1,
                    padding = 1,
                },
                { section = 'startup' },
            },
        },
    },
}
