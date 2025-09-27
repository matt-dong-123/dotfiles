return {
    'jiaoshijie/undotree',
    opts = {},
    keys = {
        {
            '<leader>u',
            function()
                require('undotree').toggle()
            end,
            desc = 'Undotree',
        },
    },
}
