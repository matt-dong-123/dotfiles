return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.ai').setup()
        require('mini.pairs').setup {
            modes = {
                command = true,
            },
        }
    end,
}
