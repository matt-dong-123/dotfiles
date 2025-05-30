return {
    'echasnovski/mini.pairs',
    event = 'BufReadPost',
    version = false,
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
}
