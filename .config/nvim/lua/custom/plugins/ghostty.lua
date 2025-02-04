return {
    {
        'ghostty',
        dir = '/Applications/Ghostty.app/Contents/Resources/vim/vimfiles/',
        lazy = false,
    },
    {
        'isak102/ghostty.nvim',
        config = function()
            require('ghostty').setup()
        end,
    },
}
