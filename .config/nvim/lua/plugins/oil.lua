return {
    'stevearc/oil.nvim',
    opts = {
        skip_confirm_for_simple_edits = true,
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
        'echasnovski/mini.nvim',
    },
    keys = {
        {
            '<leader>e',
            '<cmd>Oil --preview<CR>',
            desc = 'Open oil with preview',
        },
    },
    lazy = false,
}
