return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        require('mini.ai').setup()
        require('mini.icons').setup()
        require('mini.operators').setup()
        require('mini.pairs').setup {
            modes = {
                command = true,
            },

            -- Skip auto pair when next character is in this regex
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],

            -- Skip pairing in a string
            skip_ts = 'string',

            -- Skip auto pair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
        }
        require('mini.surround').setup()
        require('mini.hipatterns').setup {
            highlighters = {
                hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
            },
        }
    end,
}
