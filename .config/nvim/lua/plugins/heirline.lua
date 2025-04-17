return {
    'rebelot/heirline.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'folke/trouble.nvim',
    },
    config = function()
        local conditions = require 'heirline.conditions'
        local utils = require 'heirline.utils'
        local colors = require('tokyonight.colors').setup()

        -- Define statusline components
        -- NOTE: ViMode
        local ViMode = {
            init = function(self)
                self.mode = vim.fn.mode(1)
            end,
            static = {
                mode_names = {
                    ['n'] = 'NORMAL',
                    ['no'] = 'O-PENDING',
                    ['nov'] = 'O-PENDING',
                    ['noV'] = 'O-PENDING',
                    ['no\22'] = 'O-PENDING',
                    ['niI'] = 'NORMAL',
                    ['niR'] = 'NORMAL',
                    ['niV'] = 'NORMAL',
                    ['nt'] = 'NORMAL',
                    ['ntT'] = 'NORMAL',
                    ['v'] = 'VISUAL',
                    ['V'] = 'V-LINE',
                    ['Vs'] = 'V-LINE',
                    ['\22'] = 'V-BLOCK',
                    ['\22s'] = 'V-BLOCK',
                    ['s'] = 'SELECT',
                    ['S'] = 'S-LINE',
                    ['\19'] = 'S-BLOCK',
                    ['i'] = 'INSERT',
                    ['ic'] = 'INSERT',
                    ['ix'] = 'INSERT',
                    ['R'] = 'REPLACE',
                    ['Rc'] = 'REPLACE',
                    ['Rx'] = 'REPLACE',
                    ['Rv'] = 'V-REPLACE',
                    ['Rvc'] = 'V-REPLACE',
                    ['Rvx'] = 'V-REPLACE',
                    ['c'] = 'COMMAND',
                    ['cv'] = 'EX',
                    ['ce'] = 'EX',
                    ['r'] = 'REPLACE',
                    ['rm'] = 'MORE',
                    ['r?'] = 'CONFIRM',
                    ['!'] = 'SHELL',
                    ['t'] = 'TERMINAL',
                },
                mode_colors = {
                    n = colors.blue,
                    i = colors.green1,
                    v = colors.magenta,
                    V = colors.magenta,
                    ['\22'] = colors.magenta,
                    c = colors.orange,
                    s = colors.purple,
                    S = colors.purple,
                    ['\19'] = colors.purple,
                    R = colors.red,
                    r = colors.red,
                    ['!'] = colors.cyan,
                    t = colors.cyan,
                },
                -- Show text
                provider = function(self)
                    return ' %2(' .. self.mode_names[self.mode] .. '%)'
                end,

                -- Foreground
                hl = function(self)
                    local mode = self.mode:sub(1, 1)
                    return { fg = self.mode_colors[mode], bold = true }
                end,

                -- Update on mode change event
                update = {
                    'ModeChanged',
                    pattern = '*:*',
                    callback = vim.schedule_wrap(function()
                        vim.cmd 'redrawstatus'
                    end),
                },
            },
        }

        -- NOTE: File name
        -- Children will be added later
        local FileNameBlock = {
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0)
            end,
        }

        -- Set icon based on ft
        local FileIcon = {
            init = function(self)
                local filename = self.filename
                local extension = vim.fn.fnamemodify(filename, ':e')
                self.icon, self.icon_color =
                    require('nvim-web-devicons').get_icon_color(
                        filename,
                        extension,
                        { default = true }
                    )
            end,
            provider = function(self)
                return self.icon and (self.icon .. ' ')
            end,
            hl = function(self)
                return { fg = self.icon_color }
            end,
        }

        local FileName = {
            provider = function(self)
                -- Find relative file path
                local filename = vim.fn.fnamemodify(self.filename, ':.')
                if filename == '' then
                    return '[No Name]'
                end
                -- Trim path to initials if takes up 1/4 space
                if not conditions.width_percent_below(#filename, 0.25) then
                    filename = vim.fn.pathshorten(filename)
                end
                return filename
            end,
            hl = { fg = utils.get_highlight('Directory').fg },
        }

        local FileFlags = {
            {
                condition = function()
                    return vim.bo.modified
                end,
                provider = ' [+]',
                hl = { fg = 'green1' },
            },
            {
                condition = function()
                    return not vim.bo.modifiable or vim.bo.readonly
                end,
                provider = ' ',
                hl = { fg = 'orange' },
            },
        }

        -- Use modifier component to alter existing components
        local FileNameModifer = {
            hl = function()
                if vim.bo.modified then
                    -- use `force` to override the child's hl foreground
                    return { fg = 'cyan', bold = true, force = true }
                end
            end,
        }

        -- Add children
        FileNameBlock = utils.insert(
            FileNameBlock,
            FileIcon,
            utils.insert(FileNameModifer, FileName), -- FileName is FileNameModifier's child
            FileFlags
        )

        -- NOTE: Git
        local Git = {
            condition = conditions.is_git_repo,
            init = function(self)
                self.status_dict = vim.b.gitsigns_status_dict
                self.has_changes = self.status_dict.added ~= 0
                    or self.status_dict.removed ~= 0
                    or self.status_dict.changed ~= 0
            end,

            hl = { fg = 'orange' },

            { -- git branch name
                provider = function(self)
                    return ' ' .. self.status_dict.head
                end,
                hl = { bold = true },
            },
            {
                provider = function(self)
                    local count = self.status_dict.added or 0
                    return count > 0 and (' +' .. count)
                end,
                hl = { fg = colors.git.add },
            },
            {
                provider = function(self)
                    local count = self.status_dict.removed or 0
                    return count > 0 and (' -' .. count)
                end,
                hl = { fg = colors.git.delete },
            },
            {
                provider = function(self)
                    local count = self.status_dict.changed or 0
                    return count > 0 and (' ~' .. count)
                end,
                hl = { fg = colors.git.change },
            },
        }

        -- NOTE: Diagnostics
        local Diagnostics = {
            on_click = {
                callback = function()
                    require('trouble').toggle { mode = 'diagnostics' }
                end,
                name = 'heirline_diagnostics',
            },
            update = { 'DiagnosticChanged', 'BufEnter' },
            init = function(self)
                self.errors = #vim.diagnostic.get(
                    0,
                    { severity = vim.diagnostic.severity.ERROR }
                )
                self.warnings = #vim.diagnostic.get(
                    0,
                    { severity = vim.diagnostic.severity.WARN }
                )
                self.hints = #vim.diagnostic.get(
                    0,
                    { severity = vim.diagnostic.severity.HINT }
                )
                self.info = #vim.diagnostic.get(
                    0,
                    { severity = vim.diagnostic.severity.INFO }
                )
                self.error_icon =
                    vim.diagnostic.config().signs.text[vim.diagnostic.severity.ERROR]
                self.warning_icon =
                    vim.diagnostic.config().signs.text[vim.diagnostic.severity.WARN]
                self.info_icon =
                    vim.diagnostic.config().signs.text[vim.diagnostic.severity.INFO]
                self.hint_icon =
                    vim.diagnostic.config().signs.text[vim.diagnostic.severity.HINT]
            end,
            {
                provider = function(self)
                    return self.error_icon .. self.errors .. ' '
                end,
                hl = { fg = colors.red },
            },
            {
                provider = function(self)
                    return self.warning_icon .. self.warnings .. ' '
                end,
                hl = { fg = colors.yellow },
            },
            {
                provider = function(self)
                    return self.info_icon .. self.info .. ' '
                end,
                hl = { fg = colors.blue },
            },
            {
                provider = function(self)
                    return self.hint_icon .. self.hints .. ' '
                end,
                hl = { fg = colors.green1 },
            },
        }

        -- NOTE: LSP
        local LSPActive = {
            on_click = {
                callback = function()
                    vim.defer_fn(function()
                        vim.cmd 'LspInfo'
                    end, 100)
                end,
                name = 'heirline_LSP',
            },
            condition = conditions.lsp_attached,
            update = { 'LspAttach', 'LspDetach' },
            provider = function()
                local names = {}
                for _, server in pairs(vim.lsp.get_clients { bufnr = 0 }) do
                    table.insert(names, server.name)
                end
                return ' ' .. table.concat(names, ' ') .. ''
            end,
            hl = { fg = 'green', bold = true },
        }

        -- NOTE: ft
        local FileType = {
            provider = function()
                return string.upper(vim.bo.filetype)
            end,
            hl = 'Type',
        }

        -- NOTE: File Percentage
        local FilePercentage = {
            provider = '%P',
            hl = { fg = colors.red },
        }

        local Ruler = {
            provider = '%l|%L:%c',
            hl = { fg = colors.blue },
        }

        local Align = { provider = '%=' }
        local Space = { provider = ' | ' }

        local ActiveStatusLine = {
            condition = conditions.is_active,
            ViMode,
            Space,
            FileNameBlock,
            Space,
            Git,
            Space,
            Diagnostics,
            { provider = '%<' },
            Align,
            LSPActive,
            Space,
            FileType,
            Space,
            Ruler,
            Space,
            FilePercentage,
        }

        local InactiveStatusLine = {
            condition = conditions.is_not_active,
            FileNameBlock,
            Align,
            FileType,
        }

        local StatusLine = {
            InactiveStatusLine,
            ActiveStatusLine,
        }

        require('heirline').setup {
            statusline = StatusLine,
            opts = {
                colors = colors,
            },
        }
    end,
}
