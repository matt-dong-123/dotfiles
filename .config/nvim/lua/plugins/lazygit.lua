return {
    'kdheepak/lazygit.nvim',
    lazy = true,
    -- optional for floating window border decoration
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        {
            '<leader>lg',
            '<cmd>LazyGit<CR>',
            desc = 'Open LazyGit',
        },
    },
    cmd = {
        'LazyGit',
        'LazyGitConfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurrentFile',
    },
}
