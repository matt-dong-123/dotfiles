return {
    {
        'echasnovski/mini.ai',
        event = 'BufReadPost',
        version = '*',
    },
    {
        'echasnovski/mini.pairs',
        event = 'BufReadPost',
        version = '*',
        opts = {
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

            -- Markdown code blocks
            markdown = true,
        },
    },
    {
        'echasnovski/mini.icons',
        version = '*',
        opts = {},
        specs = {
            { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
        },
        -- Black magic to decieve plugins to believe it is nvim-web-devicons
        init = function()
            package.preload['nvim-web-devicons'] = function()
                require('mini.icons').mock_nvim_web_devicons()
                return package.loaded['nvim-web-devicons']
            end
        end,
    },
    {
        'echasnovski/mini.bracketed',
        event = 'VeryLazy',
        version = '*',
        opts = {},
    },
}
