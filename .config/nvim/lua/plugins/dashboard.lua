return {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
        dashboard = {
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
