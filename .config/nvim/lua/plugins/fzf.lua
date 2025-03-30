return {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
        {
            '<leader><leader>',
            ':FzfLua files<CR>',
            desc = 'Open fzf at current directory',
        },
        {
            '<leader>fd',
            ':FzfLua files cwd=~/dotfiles<CR>',
            desc = 'Open dotfiles',
        },
        {
            '<leader>fh',
            ':Fzflua helptags',
            desc = 'Find help',
        },
        {
            '<leader>fk',
            ':Fzflua keymaps',
            desc = 'Find keymaps',
        },
    },
}
