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
        require('mini.diff').setup {
            view = {
                style = 'sign',
            },
        }
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
    keys = {
        {
            '<leader>gc',
            '<cmd>Git commit<CR>',
            desc = 'Commit',
        },
        {
            '<leader>ga',
            '<cmd>Git add .<CR>',
            desc = 'Stage all',
        },
        {
            '<leader>gp',
            '<cmd>Git push<CR>',
            desc = 'Push',
        },
        {
            '<leader>gu',
            '<cmd>Git pull<CR>',
            desc = 'Pull',
        },
        {
            '<leader>gn',
            ':Git checkout -b ',
            desc = 'New Branch',
        },
        {
            '<leader>gi',
            '<cmd>Git init<CR>',
            desc = 'Initialize',
        },
    },
}
