local settings = require("settings")
local colors = require("colors")
local icons = require("icons")

local time = sbar.add("item", {
	icon = {
		string = icons.clock,
		color = colors.yellow,
		font = {
			style = settings.font.style_map["Regular"],
			size = 12.0,
		},
	},
	label = {
		color = colors.yellow,
		font = { family = settings.font.numbers },
	},
	update_freq = 1,
	position = "right",
})

time:subscribe({ "forced", "routine", "system_woke" }, function(env)
	time:set({ label = os.date("%H:%M") })
end)
