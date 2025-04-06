local g = vim.g
local map = vim.keymap.set
local expr = { silent = true, expr = true, remap = false }

-- set leader key
g.mapleader = ' '
g.maplocalleader = ' '

-- set to true because i have nerd fonts
g.have_nerd_font = true

-- NOTE: NORMAL MODE REMAPS

-- Clear highlights on search when pressing <Esc>
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic
map(
    'n',
    '<leader>q',
    vim.diagnostic.setloclist,
    { desc = 'Open diagnostic [Q]uickfix list' }
)

-- cht.sh
map(
    'n',
    '<leader>i',
    ':!tmux neww ~/dotfiles/cht.sh<CR>',
    { desc = 'Open cht.sh script' }
)

-- create panes
map('n', '<leader>sl', '<C-w>v')
map('n', '<leader>sj', '<C-w>s')

-- move focus
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map('n', '<leader>bh', '<cmd>:bprev<CR>', { desc = 'Move to previous buffer' })
map('n', '<leader>bl', '<cmd>:bnext<CR>', { desc = 'Move to next buffer' })

-- center cursor when scrolling
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

-- visually move between lines
map('', 'j', "(v:count ? 'j' : 'gj')", expr)
map('', 'k', "(v:count ? 'k' : 'gk')", expr)
map('n', 'Q', 'gq')

-- NOTE: TERMINAL MODE REMAPS

-- Exit terminal mode
-- WARNING: If this doesn't work, try <C-\><C-n>
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: VISUAL MODE REMAPS

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
