return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        vim.cmd 'TSUpdate'
        require('nvim-treesitter').install {
            'cpp',
            'json',
            'python',
            'toml',
            'regex',
            'rust',
            'bash',
            'java',
            'typst',
            'lua',
            'gitcommit',
        }
    end,
}
