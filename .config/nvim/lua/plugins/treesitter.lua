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
    config = function()
        vim.api.nvim_create_autocmd('FileType', {
            group = vim.api.nvim_create_augroup('treesitter_highlight', {}),
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if lang then
                    pcall(vim.treesitter.start, args.buf, lang)
                end
            end,
        })
    end,
}
