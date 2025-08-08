return {
    'nvim-lualine/lualine.nvim',
    opts = {
        sections = {
            lualine_a = { 'mode' },
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
