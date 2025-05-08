local opt = vim.opt

-- set colorcolumn
opt.colorcolumn = '100'

-- set relative line numbers
opt.number = true
opt.relativenumber = true

-- show hidden files
opt.hidden = true

-- enable mouse
opt.mouse = 'a'

-- don't show mode, since it's already in the statusline
opt.showmode = false

-- sync system clipboard
vim.schedule(function()
    opt.clipboard = 'unnamedplus'
end)

-- preserve horizontal blocks of text
opt.breakindent = true

-- wrap by word
opt.linebreak = true

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

-- hide non-printable characters
opt.conceallevel = 3

-- for neorg
opt.concealcursor = 'niv'
vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

-- lsp diagnostics
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
