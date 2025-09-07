local function macro()
    local reg = vim.fn.reg_recording()
    return (reg ~= '' and 'Recording @' .. reg or '')
end

return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            disabled_filetypes = { statusline = { 'snacks_dashboard' } },
        },
        sections = {
            lualine_a = { 'mode', macro },
            lualine_b = { 'filename' },
            lualine_c = { 'diagnostics', 'branch', 'diff' },
            lualine_x = { 'lsp_status', 'filetype' },
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
