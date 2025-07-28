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
    },
}
