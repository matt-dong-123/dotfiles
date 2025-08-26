vim.o.colorcolumn = '100'

vim.o.number = true
vim.o.relativenumber = true

-- show hidden files
vim.o.hidden = true

vim.o.showmode = false

vim.o.swapfile = false

vim.o.virtualedit = 'block'

-- sync system clipboard
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

-- preserve horizontal blocks of text
vim.o.breakindent = true

-- wrap by word
vim.o.linebreak = true

-- save undo history
vim.o.undofile = true

-- set case insensitive search unless capital letters in search query
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumns open (for debugging and plugins)
vim.o.signcolumn = 'yes'

-- decrease update time
vim.o.updatetime = 250

-- decrease mapped sequence delay
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

-- customize whitespace behavior
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- live substitution preview
vim.o.inccommand = 'split'

-- show line with cursor on
vim.o.cursorline = true

-- Center cursor
vim.o.scrolloff = 999

-- make tab into spaces
vim.o.expandtab = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.autoindent = true

-- true colors
vim.o.termguicolors = true

-- hide non-printable characters
vim.o.conceallevel = 3

vim.o.winborder = 'rounded'

vim.diagnostic.config {
    severity_sort = true,
    float = { border = 'rounded' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = vim.g.have_nerd_font and {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    } or {},
    virtual_text = true,
}
