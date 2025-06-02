return {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {},
    keys = {
        {
            '<leader>u',
            function()
                require('undotree').toggle()
            end,
        },
    },
}
