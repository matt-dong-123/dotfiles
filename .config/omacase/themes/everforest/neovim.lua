return {
    'neanias/everforest-nvim',
    priority = 1000,
    config = function()
        require('everforest').setup {
            transparent_background_level = 2,
        }
        vim.cmd.colorscheme 'everforest'
    end,
}
