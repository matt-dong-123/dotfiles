local g = vim.g
local map = vim.keymap.set
local expr = { silent = true, expr = true, remap = false }

-- set leader key
g.mapleader = ' '
g.maplocalleader = ' '

-- set to true because I have nerd fonts
g.have_nerd_font = true

-- NOTE: NORMAL MODE REMAPS

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('n', '<leader>sl', '<C-w>v', { desc = 'Split pane vertically' })
map('n', '<leader>sj', '<C-w>s', { desc = 'Split pane horizontally' })
map('n', '<leader>sx', '<cmd>close<cr>', { desc = 'Close current pane' })

-- visually move between lines
map('', 'j', "(v:count ? 'j' : 'gj')", expr)
map('', 'k', "(v:count ? 'k' : 'gk')", expr)

-- Unwrap
map('n', 'Q', 'gq')

map('n', '<leader>r', function()
    vim.lsp.buf.rename()
end, { desc = 'Rename' })

map('n', '<leader>c', function()
    vim.lsp.buf.code_action()
end, { desc = 'Code actions' })

map('n', '<leader>w', '<cmd>w<CR>')
map('n', '<leader>q', '<cmd>q!<CR>')

map('n', '<CR>', '<cmd>wq!<CR>')

-- Indent line
map('n', '<Tab>', '>>')
map('n', '<S-Tab>', '<<')
-- NOTE: VISUAL MODE REMAPS

-- Move selected text up/down
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Indenting selected lines
map('v', '<Tab>', '>gv')
map('v', '<S-Tab>', '<gv')
