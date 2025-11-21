return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
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
