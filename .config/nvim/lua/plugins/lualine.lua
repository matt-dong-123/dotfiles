local function macro()
    local reg = vim.fn.reg_recording()
    return (reg ~= '' and 'Recording @' .. reg or '')
end

return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
        options = {
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = { statusline = { 'snacks_dashboard' } },
        },
        sections = {
            lualine_a = { 'mode', macro },
            lualine_b = { 'filename' },
            lualine_c = { 'diagnostics', 'branch', 'diff' },
            lualine_x = {
                {
                    function()
                        return require('noice').api.status.command.get()
                    end,
                    cond = function()
                        return package.loaded['noice'] and require('noice').api.status.command.has()
                    end,
                    color = function()
                        return { fg = Snacks.util.color 'Statement' }
                    end,
                },
                'lsp_status',
                'filetype',
            },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {},
        },
    },
}
