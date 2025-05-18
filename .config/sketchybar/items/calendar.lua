local settings = require("settings")
local colors = require("colors")

local cal = sbar.add("item", {
	icon = {
		color = colors.red,
		padding_left = 8,
		font = {
			style = settings.font.style_map["Black"],
			size = 12.0,
		},
	},
	label = {
		color = colors.green,
		padding_right = 8,
		width = 49,
		align = "right",
		font = { family = settings.font.numbers },
	},
	position = "right",
	update_freq = 1,
	padding_left = 1,
	padding_right = 1,
	background = {
		color = colors.bg1,
		border_color = colors.black,
		border_width = 1,
	},
})

sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({ icon = os.date("%b %d %a "), label = os.date("%H:%M") })
end)

cal:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Calendar'")
end)
