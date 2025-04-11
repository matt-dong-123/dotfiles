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
            '<leader>fc',
            ':FzfLua files cwd=~/dotfiles/.config/nvim<CR>',
            desc = 'Open nvim config',
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
        {
            '<leader>,',
            ':FzfLua buffers sort_mru=true sort_lastused=true<CR>',
            desc = 'Switch buffers',
        },
    },
}
