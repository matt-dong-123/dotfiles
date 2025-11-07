return {
    'monkoose/neocodeium',
    event = 'VeryLazy',
    opts = {},
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
