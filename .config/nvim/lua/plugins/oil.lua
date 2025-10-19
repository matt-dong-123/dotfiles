return {
    'stevearc/oil.nvim',
    opts = {
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, _)
                if name == '.DS_Store' then
                    return true
                end
                return false
            end,
        },
    },
    dependencies = {
        'nvim-mini/mini.nvim',
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
