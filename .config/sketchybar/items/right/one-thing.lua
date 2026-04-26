local colors = require 'colors'
local settings = require 'settings'

local home = os.getenv 'HOME'
local filepath = home .. '/.config/sketchybar/one-thing.txt'

-- Function to read the content from the file
local function read_one_thing()
    local file = io.open(filepath, 'r')
    if file then
        local content = file:read('*all'):gsub('[\n\r]', '')
        file:close()
        return content
    end
    return 'click me' -- don't edit here, click the widget and change its text instead
end

local one_thing = sbar.add('item', 'right.one-thing', {
    position = 'right',
    icon = { drawing = false },
    label = {
        string = read_one_thing(),
        padding_left = settings.paddings,
        font = { family = settings.font.text },
        color = colors.default,
    },
})

one_thing:subscribe('mouse.clicked', function()
    sbar.exec(
        'kitten quick-access-terminal --instance-group=onething nvim "' .. filepath .. '"',
        function()
            one_thing:set {
                label = { string = read_one_thing() },
            }
        end
    )
end)

sbar.add('item', 'right.one_thing.padding', {
    position = 'right',
    width = settings.group_paddings,
})
