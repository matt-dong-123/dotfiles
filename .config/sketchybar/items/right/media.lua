local icons = require 'icons'
local colors = require 'colors'

local media = sbar.add('item', 'right.media', {
    position = 'right',
    icon = {
        color = colors.green,
        string = icons.music,
    },
    label = {
        color = colors.green,
    },
    update_freq = 1,
    click_script = 'kitten quick-access-terminal --instance-group=music sesh connect Music',
})

media:subscribe({ 'forced', 'routine', 'system_woke' }, function()
    sbar.exec("rmpc song | jq '.metadata.title' -M | sed 's/\"//g'", function(out)
        media:set {
            label = {
                string = out,
            },
        }
    end)
end)
