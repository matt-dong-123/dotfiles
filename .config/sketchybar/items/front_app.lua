local settings = require("settings")
local app_icons = require("helpers.app_icons")
local colors = require("colors")

local front_app = sbar.add("item", "front_app", {
	display = "active",
	icon = {
		font = "sketchybar-app-font:Regular:20.0",
		color = colors.default,
	},
	label = {
		font = {
			size = 20.0,
			style = settings.font.style_map["Bold"],
		},
	},
	updates = true,
})

front_app:subscribe("front_app_switched", function(env)
	front_app:set({
		icon = { string = app_icons[env.INFO] == nil and app_icons["default"] or app_icons[env.INFO] },
		label = { string = env.INFO },
	})
end)

front_app:subscribe("mouse.clicked", function(env)
	sbar.trigger("swap_menus_and_spaces")
end)
