local g = vim.g
local opt = vim.opt


-- set relative line numbers
opt.number = true
opt.relativenumber = true

-- enable mouse
opt.mouse = 'a'

-- don't show mode, since it's already in lualine
opt.showmode = false

-- sync system clipboard
vim.schedule(function()
    opt.clipboard = 'unnamedplus'
end)

-- enable break indent
opt.breakindent = true

-- save undo history
opt.undofile = true

-- set case insensitive search unless capital letters in search query
opt.ignorecase = true
opt.smartcase = true

-- keep signcolumns open (for debugging and plugins)
opt.signcolumn = 'yes'

-- decrease update time
opt.updatetime = 250

-- decrease mapped sequence delay
opt.timeoutlen = 300

-- configure new splits
opt.splitright = true
opt.splitbelow = true

-- customize whitespace behavior
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- live substitution preview
opt.inccommand = 'split'

-- show line with cursor on
opt.cursorline = true

-- minimal number of lines above and below cursor
opt.scrolloff = 10

-- make tab into spaces
opt.expandtab = true

-- set tab size to 4
opt.tabstop = 4

-- set softtabstop to 4
opt.softtabstop = 4

-- set shiftwidth to 4
opt.shiftwidth = 4

-- set autoindent
opt.autoindent = true

-- true colors
opt.termguicolors = true
