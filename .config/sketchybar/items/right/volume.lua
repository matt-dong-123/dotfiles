local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local volume = sbar.add("item", "right.volume", {
	position = "right",
	icon = {
		font = {
			style = settings.font.style_map["Regular"],
		},
	},
	label = { font = { family = settings.font.numbers } },
	update_freq = 1,
})

function get_volume()
	sbar.exec("osascript -e 'output volume of (get volume settings)'", function(volume_level)
		local level = tonumber(volume_level)
		local icon = icons.volume._0
		local color = colors.default

		if level == 0 then
			icon = icons.volume._0
			color = colors.grey
		elseif level <= 33 then
			icon = icons.volume._10
		elseif level <= 66 then
			icon = icons.volume._33
		else
			icon = icons.volume._100
			if level >= 90 then
				color = colors.red
			end
		end

		local label = level .. "%"

		volume:set({
			icon = {
				string = icon,
				color = color,
			},
			label = {
				string = label,
				color = color,
			},
		})
	end)
end

volume:subscribe({ "routine", "system_woke" }, get_volume())
get_volume()
