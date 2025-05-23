return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'c',
                'lua',
                'vim',
                'vimdoc',
                'query',
                'markdown',
                'markdown_inline',
            },
            sync_install = false,
            highlight = {
                enable = true,
                -- Disable for large files
                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 Kb
                    local ok, stats =
                        pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },
            indent = { enable = true },
        }
    end,
}
