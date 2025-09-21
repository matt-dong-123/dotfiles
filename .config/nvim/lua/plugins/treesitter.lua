return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    cond = function()
        return vim.bo.filetype ~= 'markdown'
    end,
    opts = {
        ensure_installed = {
            'cpp',
            'json',
            'python',
            'toml',
            'regex',
            'rust',
            'bash',
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
