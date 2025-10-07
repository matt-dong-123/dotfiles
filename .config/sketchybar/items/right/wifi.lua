local icons = require("icons")
local colors = require("colors")

local wifi = sbar.add("item", "right.wifi", {
	position = "right",
	icon = {
		font = {
			size = 12.0,
		},
	},
	label = {
		font = {
			size = 12.0,
		},
	},
	update_freq = 5,
})

function test_wifi()
	sbar.exec("networksetup -listpreferredwirelessnetworks en0 | sed -n '2 p' | tr -d '\t'", function(out)
		local icon = icons.wifi.disconnected
		local label = "Disconnected"
		local color = colors.red

		local name = out:gsub("%s+", "")
		if name ~= "" then
			icon = icons.wifi.connected
			label = name
			color = colors.green
		end

		wifi:set({
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

wifi:subscribe({ "routine", "system_woke" }, test_wifi())
test_wifi()
