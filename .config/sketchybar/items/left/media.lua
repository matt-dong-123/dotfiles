local icons = require 'icons'
local colors = require 'colors'

local media = sbar.add('item', 'right.media', {
    position = 'left',
    icon = {
        color = colors.grey,
        string = icons.music,
    },
    label = {
        color = colors.grey,
    },
    update_freq = 1,
    click_script = 'kitten quick-access-terminal --instance-group=music sesh connect Music',
})

media:subscribe({ 'forced', 'routine', 'system_woke' }, function()
    sbar.exec(
        [[state=$(rmpc status | jq -r '.state'); title=$(rmpc song | jq -r '.metadata.title // empty'); echo "$state|$title"]],
        function(result)
            local state, title = result:match('^(.-)|(.-)$')
            local isPlaying = state == 'Play'
            local color = isPlaying and colors.green or colors.grey
            media:set {
                icon = { color = color },
                label = {
                    string = title ~= '' and title or ' ',
                    color = color,
                },
            }
        end
    )
end)
