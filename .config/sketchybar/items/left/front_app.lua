local settings = require("settings")
local app_icons = require("helpers.app_icons")
local colors = require("colors")

local front_app = sbar.add("item", "front_app", {
	display = "active",
	icon = {
		font = "sketchybar-app-font:Regular:20.0",
		color = colors.yellow,
	},
	label = {
		font = {
			family = settings.font.text,
			size = 16.0,
		},
		color = colors.yellow,
	},
	updates = true,
})

front_app:subscribe("front_app_switched", function(env)
	front_app:set({
		icon = { string = app_icons[env.INFO] == nil and "" or app_icons[env.INFO] },
		label = { string = env.INFO },
	})
end)
