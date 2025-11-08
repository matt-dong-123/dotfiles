return {
    'monkoose/neocodeium',
    event = 'VeryLazy',
    opts = {},
    build = ':NeoCodeium auth',
    keys = {
        {
            '<Tab>',
            mode = 'i',
            function()
                require('neocodeium').accept()
            end,
            desc = 'Accept from codeium',
        },
    },
}
