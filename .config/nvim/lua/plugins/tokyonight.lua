return {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
        vim.cmd.colorscheme 'tokyonight-night'
    end,
    opts = {},
}
