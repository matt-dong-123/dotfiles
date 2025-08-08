return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            'c',
            'cpp',
            'go',
            'json',
            'lua',
            'python',
            'vim',
            'vimdoc',
            'query',
            'markdown',
            'markdown_inline',
            'toml',
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
    },
}
