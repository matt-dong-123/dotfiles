return {
    'echasnovski/mini.icons',
    event = 'UIEnter',
    version = false,
    opts = {},
    specs = {
        { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
    },
    -- Black magic to decieve plugins to believe it is nvim-web-devicons
    init = function()
        package.preload['nvim-web-devicons'] = function()
            require('mini.icons').mock_nvim_web_devicons()
            return package.loaded['nvim-web-devicons']
        end
    end,
}
