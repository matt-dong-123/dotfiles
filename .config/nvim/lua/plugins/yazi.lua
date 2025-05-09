return {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    dependencies = {
        'folke/snacks.nvim',
    },
    keys = {
        {
            '<leader>e',
            '<cmd>Yazi<cr>',
            desc = 'Open Yazi',
        },
        {
            '<leader>E',
            '<cmd>Yazi cwd<cr>',
            desc = 'Open Yazi in working directory',
        },
    },

    -- Suppress netrw
    opts = {
        open_for_directories = true,
    },
    init = function()
        vim.g.loaded_netrwPlugin = 1
    end,
}
