local function map(module, fn)
    return function()
        require(module)[fn]()
    end
end

return {
    'mrjones2014/smart-splits.nvim',
    opts = {},
    keys = {
        {
            '<C-h>',
            map('smart-splits', 'move_cursor_left'),
            desc = 'Move to left window',
        },
        {
            '<C-j>',
            map('smart-splits', 'move_cursor_down'),
            desc = 'Move to downward window',
        },
        {
            '<C-k>',
            map('smart-splits', 'move_cursor_up'),
            desc = 'Move to upward window',
        },
        {
            '<C-l>',
            map('smart-splits', 'move_cursor_right'),
            desc = 'Move to right window',
        },
        {
            '<A-h>',
            map('smart-splits', 'resize_left'),
            desc = 'Resize window left',
        },
        {
            '<A-j>',
            map('smart-splits', 'resize_down'),
            desc = 'Resize window down',
        },
        {
            '<A-k>',
            map('smart-splits', 'resize_up'),
            desc = 'Resize window up',
        },
        {
            '<A-l>',
            map('smart-splits', 'resize_right'),
            desc = 'Resize window right',
        },
    },
}
