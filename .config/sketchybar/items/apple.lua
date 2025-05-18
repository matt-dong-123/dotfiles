local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

sbar.add("item", {
	icon = {
		font = { size = 20.0 },
		string = icons.apple,
		padding_right = 8,
		padding_left = 8,
		color = colors.green,
	},
	label = { drawing = false },
	padding_left = 1,
	padding_right = 1,
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
})
