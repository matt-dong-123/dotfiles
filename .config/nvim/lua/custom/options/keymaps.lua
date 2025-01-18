local g = vim.g
local keymapset = vim.keymap.set
-- set leader key
g.mapleader = ' '
g.maplocalleader = ' '

-- set to true because i have nerd fonts
g.have_nerd_font = true

-- NOTE: NORMAL MODE REMAPS

-- Clear highlights on search when pressing <Esc>
keymapset('n', '<Esc', '<cmd>nohlsearch<CR>')

-- Diagnostic
keymapset('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- inc-rename
keymapset('n', '<leader>rn', ':IncRename ')

-- create panes
keymapset('n', '<leader>sl', '<C-w>v')
keymapset('n', '<leader>sj', '<C-w>s')

-- move focus
keymapset('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymapset('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymapset('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymapset('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
keymapset('n', '<leader>bh', '<cmd>:bprev<CR>', { desc = 'Move to previous buffer' })
keymapset('n', '<leader>bl', '<cmd>:bnext<CR>', { desc = 'Move to next buffer' })

-- center cursor when scrolling
keymapset('n', '<C-u>', '<C-u>zz')
keymapset('n', '<C-d>', '<C-d>zz')
-- NOTE: TERMINAL MODE REMAPS

-- Exit terminal mode
-- NOTE: If this doesn't work, try <C-\><C-n>
keymapset('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: VISUAL MODE REMAPS
keymapset('v', 'J', ":m '>+1<CR>gv=gv")
keymapset('v', 'K', ":m '<-2<CR>gv=gv")
