return {
    'rose-pine/neovim',
    name = 'rose-pine.nvim',
    priority = 1000,
    opts = {
        variant = 'auto',
        styles = {
            transparency = true,
        },
    },
    init = function()
        vim.cmd.colorscheme 'rose-pine-moon'
    end,
}
