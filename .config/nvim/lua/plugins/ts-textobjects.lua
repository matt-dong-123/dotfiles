return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    init = function()
        require('nvim-treesitter.configs').setup {
            textobjects = {
                select = {
                    enable = true,
                    -- Auto jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        ['af'] = {
                            query = '@function.outer',
                            desc = 'Select outer part of function',
                        },
                        ['if'] = {
                            query = '@function.inner',
                            desc = 'Select inner part of function',
                        },
                        ['ac'] = {
                            query = '@class.outer',
                            desc = 'Select outer part of class',
                        },
                        ['ic'] = {
                            query = '@class.inner',
                            desc = 'Select inner part of class',
                        },
                        ['ao'] = {
                            query = '@comment.outer',
                            desc = 'Select outer part of comment',
                        },
                        ['io'] = {
                            query = '@comment.inner',
                            desc = 'Select inner part of comment',
                        },
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>a'] = {
                            query = '@parameter.inner',
                            desc = 'Swap with next parameter',
                        },
                    },
                    swap_previous = {
                        ['<leader>A'] = {
                            query = '@parameter.inner',
                            desc = 'Swap with previous parameter',
                        },
                    },
                },
            },
        }
    end,
}
