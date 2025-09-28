return {
    'nvim-mini/mini.nvim',
    version = false,
    event = 'VeryLazy',
    config = function()
        require('mini.ai').setup()
        require('mini.bracketed').setup()
        require('mini.icons').setup()
        require('mini.operators').setup()
        require('mini.comment').setup()
        require('mini.surround').setup()
        require('mini.git').setup()
        require('mini.pairs').setup {
            modes = {
                command = true,
            },
        }
        require('mini.hipatterns').setup {
            highlighters = {
                hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
            },
        }
    end,
}
