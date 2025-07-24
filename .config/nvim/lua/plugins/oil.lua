return {
    'stevearc/oil.nvim',
    opts = {
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, bufnr)
                if name == '.DS_Store' then
                    return true
                end
                return false
            end,
        },
    },
    dependencies = {
        'echasnovski/mini.icons',
    },
    keys = {
        {
            '<leader>e',
            '<cmd>Oil<CR>',
            desc = 'Open oil',
        },
    },
    lazy = false,
}
