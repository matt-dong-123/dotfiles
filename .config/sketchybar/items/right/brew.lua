local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local brew = sbar.add("item", "right.brew", {
	position = "right",
	icon = {
		string = icons.package,
		font = {
			style = settings.font.style_map["Regular"],
		},
	},
	label = {
		string = "?",
		font = {
			family = settings.font.numbers,
		},
	},
	update_freq = 60,
})

brew:subscribe({ "routine", "system_woke" }, function()
	sbar.exec('brew outdated | wc -l | tr -d " "', function(out)
		local label = "?"
		local color = colors.default
		local count = tonumber(out)

		if count > 0 then
			label = tostring(count)
			if count >= 1 and count <= 3 then
				color = colors.yellow
			else
				if count > 3 and count <= 10 then
					color = colors.orange
				elseif count > 10 then
					color = colors.red
				end
			end
		else
			label = icons.checkmark
			color = colors.green
		end

		brew:set({
			icon = {
				color = color,
			},
			label = {
				string = label,
				color = color,
			},
		})
	end)
end)
