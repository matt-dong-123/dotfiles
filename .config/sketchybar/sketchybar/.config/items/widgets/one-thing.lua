local colors = require("colors")
local settings = require("settings")

local one_thing = sbar.add("item", "widgets.one-thing", {
	position = "right",
	icon = { drawing = false },
	label = {
		string = "Love cat ❤️🐱",
		padding_left = settings.padding,
		font = { family = settings.font.text },
		color = colors.default,
	},
})

local one_thing_bracket = sbar.add("bracket", "widgets.one_thing.bracket", {
	one_thing.name,
}, {
	background = { color = colors.bg1 },
})

sbar.add("item", "widgets.one_thing.padding", {
	position = "right",
	width = settings.group_paddings,
})
