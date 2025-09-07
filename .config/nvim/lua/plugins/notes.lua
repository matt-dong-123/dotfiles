return {
    'OXY2DEV/markview.nvim',
    ft = 'markdown',
    dependencies = {
        'nvim-mini/mini.nvim',
    },
    config = function()
        require('markview').setup()
        require('nvim-treesitter').setup()
    end,
}
