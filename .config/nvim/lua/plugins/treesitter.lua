return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    cond = function()
        return vim.bo.filetype ~= 'markdown'
    end,
    opts = {
        ensure_installed = {
            'c',
            'cpp',
            'json',
            'lua',
            'python',
            'vim',
            'vimdoc',
            'query',
            'markdown',
            'markdown_inline',
            'toml',
            'regex',
            'rust',
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
