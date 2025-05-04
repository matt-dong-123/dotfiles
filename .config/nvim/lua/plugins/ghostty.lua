return {
    {
        'ghostty',
        dir = '/Applications/Ghostty.app/Contents/Resources/vim/vimfiles/',
    },
    {
        'isak102/ghostty.nvim',
        config = function()
            require('ghostty').setup()
        end,
    },
}
