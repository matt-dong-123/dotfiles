return {
    'folke/snacks.nvim',
    lazy = false,
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
                        icon = ' ',
                        key = 'g',
                        desc = 'Find Text',
                        action = ":lua Snacks.dashboard.pick('live_grep')",
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
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    {
                        icon = ' ',
                        key = 'n',
                        desc = 'Notes',
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.expand('$HOME/Notes')})",
                    },
                    {
                        icon = ' ',
                        key = 's',
                        desc = 'Restore Session',
                        section = 'session',
                    },
                    {
                        icon = '󰒲 ',
                        key = 'l',
                        desc = 'Lazy',
                        action = ':Lazy',
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
                },
            },
            sections = {
                { section = 'header' },
                { section = 'keys', gap = 1, padding = 1 },
                {
                    pane = 2,
                    section = 'terminal',
                    cmd = 'pipes.sh -t3 -c1 -c2 -c3 -c4 -c5 -c6 -c7',
                    height = 10,
                    padding = 1,
                },
                {
                    pane = 2,
                    icon = ' ',
                    title = 'Recent Files',
                    section = 'recent_files',
                    indent = 2,
                    padding = 1,
                },
                {
                    pane = 2,
                    icon = ' ',
                    title = 'Projects',
                    section = 'projects',
                    indent = 2,
                    padding = 1,
                },
                { section = 'startup' },
            },
        },
    },
}
