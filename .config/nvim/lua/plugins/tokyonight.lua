return {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
        vim.cmd.colorscheme 'tokyonight-moon'
    end,
    opts = {
        transparent = true,
        styles = {
            sidebars = 'transparent',
            floats = 'transparent',
        },
    },
}
