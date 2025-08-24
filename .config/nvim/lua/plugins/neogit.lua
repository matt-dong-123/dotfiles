return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'folke/snacks.nvim',
        'sindrets/diffview.nvim',
    },
    opts = {
        integrations = {
            diffview = true,
            snacks = true,
        },
    },
}
