return {
    {
        'echasnovski/mini.ai',
        version = '*',
    },
    {
        'echasnovski/mini.pairs',
        version = '*',
        opts = {
            modes = {
                command = true,
            },
        },
    },
    {
        'echasnovski/mini.icons',
        version = '*',
        opts = {},
        specs = {
            { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
        },
        init = function()
            package.preload['nvim-web-devicons'] = function()
                require('mini.icons').mock_nvim_web_devicons()
                return package.loaded['nvim-web-devicons']
            end
        end,
    },
}
