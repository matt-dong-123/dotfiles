return {
    'monaqa/dial.nvim',
    keys = {
        {
            '<C-a>',
            function()
                require('dial.map').manipulate('increment', 'normal')
            end,
        },
        {
            '<C-x>',
            function()
                require('dial.map').manipulate('decrement', 'normal')
            end,
        },
        {
            mode = { 'x', 's' },
            '<C-a>',
            function()
                require('dial.map').manipulate('increment', 'visual')
            end,
        },
        {
            mode = { 'x', 's' },
            '<C-x>',
            function()
                require('dial.map').manipulate('decrement', 'visual')
            end,
        },
        {
            'g<C-a>',
            function()
                require('dial.map').manipulate('increment', 'gnormal')
            end,
        },
        {
            'g<C-x>',
            function()
                require('dial.map').manipulate('decrement', 'gnormal')
            end,
        },
        {
            mode = { 'x', 's' },
            'g<C-a>',
            function()
                require('dial.map').manipulate('increment', 'gvisual')
            end,
        },
        {
            mode = { 'x', 's' },
            'g<C-x>',
            function()
                require('dial.map').manipulate('decrement', 'gvisual')
            end,
        },
    },
    config = function()
        local augend = require 'dial.augend'
        require('dial.config').augends:register_group {
            default = {
                augend.integer.alias.decimal,
                augend.date.alias['%Y/%m/%d'],
                augend.constant.alias.bool,
                augend.decimal_fraction.new { signed = true },
                augend.date.new {
                    pattern = '%Y/%m/%d',
                    default_kind = 'day',
                    clamp = true,
                    end_sensitive = true,
                },
            },
        }
        require('dial.config').augends:on_filetype {
            markdown = { augend.misc.alias.markdown_header },
        }
    end,
}
