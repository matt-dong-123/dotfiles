-- default parsers to install
local parsers = {
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

-- autoinstall missing parsers on filetype detection
vim.api.nvim_create_autocmd('FileType', {
    callback = function(event)
        local bufnr = event.buf

        -- skip special buffers
        if vim.bo[bufnr].buftype ~= '' then
            return
        end

        -- try to start treesitter, return on success
        local ok = pcall(vim.treesitter.start)
        if ok then
            return
        end

        -- install missing parser if language is supported
        local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
        if lang then
            require('nvim-treesitter').install { lang }
            pcall(vim.treesitter.start)
        end
    end,
})

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    init = function()
        require('nvim-treesitter').install(parsers)
    end,
}
