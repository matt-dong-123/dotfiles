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
            ':FzfLua helptags<CR>',
            desc = 'Find help',
        },
        {
            '<leader>fk',
            ':FzfLua keymaps<CR>',
            desc = 'Find keymaps',
        },
        {
            '<leader>ft',
            ':FzfLua grep_curbuf<CR>',
            desc = 'Find text in current buffer',
        },
    },
}
