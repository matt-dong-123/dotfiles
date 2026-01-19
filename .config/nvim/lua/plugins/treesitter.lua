return {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
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
            'typst',
            'gitcommit',
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
