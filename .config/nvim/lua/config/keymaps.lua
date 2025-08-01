local g = vim.g
local map = vim.keymap.set
local expr = { silent = true, expr = true, remap = false }

-- set leader key
g.mapleader = ' '
g.maplocalleader = ' '

-- set to true because I have nerd fonts
g.have_nerd_font = true

-- NOTE: NORMAL MODE REMAPS

-- Clear highlights on search when pressing <Esc>
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Increment/Decrement numbers
map('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
map('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

-- create panes
map('n', '<leader>sl', '<C-w>v', { desc = 'Split pane vertically' })
map('n', '<leader>sj', '<C-w>s', { desc = 'Split pane horizontally' })
map('n', '<leader>sx', '<cmd>close<cr>', { desc = 'Close current pane' })

-- visually move between lines
map('', 'j', "(v:count ? 'j' : 'gj')", expr)
map('', 'k', "(v:count ? 'k' : 'gk')", expr)

-- Unwrap
map('n', 'Q', 'gq')

-- Rename symbol under cursor
map('n', '<leader>r', function()
    vim.lsp.buf.rename()
end, { desc = 'Rename' })

-- Code actions
map('n', '<leader>c', function()
    vim.lsp.buf.code_action()
end, { desc = 'Code actions' })

map('n', '<leader>w', '<cmd>w<CR>', { desc = 'Write' })
map('n', '<leader>q', '<cmd>q!<CR>', { desc = 'Quit w/o saving' })

map('n', '<CR>', '<cmd>wqa!<CR>', { desc = 'Force save and exit all buffers' })
-- NOTE: TERMINAL MODE REMAPS

-- Exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: VISUAL MODE REMAPS

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
