return {
    'monkoose/neocodeium',
    event = 'VeryLazy',
    opts = {},
    build = ':NeoCodeium auth',
    keys = {
        {
            '<C-f>',
            mode = 'i',
            function()
                require('neocodeium').accept()
            end,
            desc = 'Accept from codeium',
        },
    },
}
