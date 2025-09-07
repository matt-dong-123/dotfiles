return {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
        transparent = true,
        styles = {
            sidebars = 'transparent',
            floats = 'transparent',
        },
    },
    init = function()
        vim.cmd.colorscheme 'tokyonight-moon'
    end,
}
