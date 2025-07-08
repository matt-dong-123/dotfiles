local settings = require("settings")
local colors = require("colors")
local icons = require("icons")

local date = sbar.add("item", {
	icon = {
		string = icons.calendar,
		color = colors.magenta,
		font = {
			style = settings.font.style_map["Regular"],
		},
	},
	label = {
		color = colors.magenta,
		font = { family = settings.font.text },
	},
	position = "right",
	update_freq = 1,
})

date:subscribe({ "forced", "routine", "system_woke" }, function(env)
	date:set({ label = os.date("%a %d") })
end)
