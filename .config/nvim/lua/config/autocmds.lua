-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Quit with q in certain filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('close-with-q', { clear = true }),
    desc = 'Close with <q>',
    pattern = {
        'fugitive',
        'git',
        'help',
        'man',
        'qf',
        'query',
        'scratch',
    },
    callback = function(args)
        vim.keymap.set('n', 'q', '<cmd>quit<cr>', { buffer = args.buf })
    end,
})

-- auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd('VimResized', {
    command = 'wincmd =',
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('no_auto_comment', {}),
    callback = function()
        vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
    end,
})

vim.filetype.add {
    pattern = {
        ['.*/%.config/tmux/.*'] = 'tmux',
    },
}

-- Set filetype to 'conf' for files without extension
vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*',
    callback = function()
        if vim.fn.expand('%:e') == '' then
            vim.bo.filetype = 'conf'
        end
    end,
})
