return {
    'folke/snacks.nvim',
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            sections = {
                {
                    section = 'header',
                    hl = 'SpecialKey',
                },
                {
                    section = 'keys',
                    gap = 1,
                    padding = 1,
                },
                {
                    section = 'startup',
                },
            },
            formats = {
                icon = function(item)
                    if item.file and item.icon == 'file' or item.icon == 'directory' then
                        return M.icon(item.file, item.icon)
                    end
                    return { item.icon, width = 2, hl = 'icon' }
                end,
                footer = { '%s', align = 'center' },
                header = { '%s', align = 'center' },
                file = function(item, ctx)
                    local fname = vim.fn.fnamemodify(item.file, ':~')
                    fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
                    if #fname > ctx.width then
                        local dir = vim.fn.fnamemodify(fname, ':h')
                        local file = vim.fn.fnamemodify(fname, ':t')
                        if dir and file then
                            file = file:sub(-(ctx.width - #dir - 2))
                            fname = dir .. '/' .. file
                        end
                    end
                    return fname
                end,
            },
            keys = {
                { icon = '', key = 'f', desc = 'Find File', action = ':Telescope find_files' },
                { icon = '', key = 'n', desc = 'New File', action = ':ene | startinsert' },
                { icon = '', key = 'g', desc = 'Find Text', action = ':Telescope live_grep' },
                { icon = '', key = 'r', desc = 'Recent Files', action = ':Telescope oldfiles' },
                { icon = '', key = 'c', desc = 'Config', action = ':Telescope find_files cwd=$XDG_CONFIG_HOME/nvim' },
                { icon = '', key = 's', desc = 'Restore Session', section = 'session' },
                { icon = '', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
                { icon = '', key = 'q', desc = 'Quit', action = ':qa' },
            },
            header = [[
  ███╗ ██╗███████╗ ██████╗ ██╗ ██╗██╗███╗ ███╗ ████╗ ██║██╔════╝██╔═══██╗██║ ██║██║████╗ ████║ ██╔██╗ ██║█████╗ ██║ ██║██║ ██║██║██╔████╔██║ ██║╚██╗██║██╔══╝ ██║ ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ╚═╝ ╚═══╝╚══════╝ ╚═════╝ ╚═══╝ ╚═╝╚═╝ ╚═╝
  ]],
        },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true, timeout = 3000 },
        quickfile = { enabled = true },
        scroll = {
            enabled = true,
            easing_function = 'quadratic',
        },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}
