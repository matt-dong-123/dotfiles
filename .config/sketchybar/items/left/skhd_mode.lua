local colors = require 'colors'

local skhd_mode = sbar.add('item', 'skhd_mode', {
    position = 'left',
    label = {
        font = {
            size = 18,
        },
        string = ' ',
        color = colors.red,
    },
})

skhd_mode:subscribe('skhd_mode_change', function(env)
    skhd_mode:set {
        label = {
            string = env.SKHD_MODE_LABEL,
        },
    }
end)
