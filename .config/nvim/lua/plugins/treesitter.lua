return {
    'romus204/tree-sitter-manager.nvim',
    dependencies = {}, -- tree-sitter CLI must be installed system-wide
    config = function()
        require('tree-sitter-manager').setup {
            ensure_installed = {
                'lua',
                'java',
                'cpp',
                'c',
                'python',
                'html',
                'css',
                'javascript',
                'go',
                'tmux',
                'markdown',
            },
        }
    end,
}
