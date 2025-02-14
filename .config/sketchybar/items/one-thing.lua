local colors = require("colors")
local settings = require("settings")

-- Function to read the content from the file
local function read_one_thing()
    local file = io.open(os.getenv("HOME") .. "/one-thing/one-thing.txt", "r")
    if file then
        local content = file:read("*all"):gsub("[\n\r]", "")
        file:close()
        return content
    end
    return "Stay productive! 💪" -- don't edit here, click the widget and change its text instead
end

local one_thing = sbar.add("item", "widgets.one-thing", {
    position = "right",
    icon = { drawing = false },
    label = {
        string = read_one_thing(),
        padding_left = settings.padding,
        font = { family = settings.font.text },
        color = colors.default,
    },
})

one_thing:subscribe("mouse.clicked", function()
    sbar.exec('wezterm start --always-new-process nvim "$HOME/one-thing/one-thing.txt"', function()
        one_thing:set({
            label = { string = read_one_thing() }
        })
    end)
end)

sbar.add("bracket", "widgets.one_thing.bracket", {
    one_thing.name,
}, {
    background = { color = colors.bg1 },
})

sbar.add("item", "widgets.one_thing.padding", {
    position = "right",
    width = settings.group_paddings,
})
