return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            'cpp',
            'json',
            'python',
            'toml',
            'regex',
            'rust',
            'bash',
            'java',
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
