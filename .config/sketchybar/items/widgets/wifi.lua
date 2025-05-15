local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Execute the event provider binary which provides the event "network_update"
-- for the network interface "en0", which is fired every 2.0 seconds.
sbar.exec(
	"killall network_load >/dev/null; $CONFIG_DIR/helpers/event_providers/network_load/bin/network_load en0 network_update 2.0"
)

local popup_width = 250

local wifi_up = sbar.add("item", "widgets.wifi1", {
	position = "right",
	padding_left = -5,
	width = 0,
	icon = {
		padding_right = 0,
		font = {
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		string = icons.wifi.upload,
	},
	label = {
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		color = colors.red,
		string = "??? Bps",
	},
	y_offset = 4,
})

local wifi_down = sbar.add("item", "widgets.wifi2", {
	position = "right",
	padding_left = -5,
	icon = {
		padding_right = 0,
		font = {
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		string = icons.wifi.download,
	},
	label = {
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		color = colors.green,
		string = "??? Bps",
	},
	y_offset = -4,
})

local wifi = sbar.add("item", "widgets.wifi.padding", {
	position = "right",
	label = { drawing = false },
})

wifi_up:subscribe("network_update", function(env)
	local up_color = (env.upload == "000 Bps") and colors.grey or colors.red
	local down_color = (env.download == "000 Bps") and colors.grey or colors.green
	wifi_up:set({
		icon = { color = up_color },
		label = {
			string = env.upload,
			color = up_color,
		},
	})
	wifi_down:set({
		icon = { color = down_color },
		label = {
			string = env.download,
			color = down_color,
		},
	})
end)

wifi:subscribe({ "wifi_change", "system_woke" }, function(env)
	sbar.exec("ipconfig getifaddr en0", function(ip)
		local connected = not (ip == "")
		wifi:set({
			icon = {
				string = connected and icons.wifi.connected or icons.wifi.disconnected,
				color = connected and colors.default or colors.red,
			},
		})
	end)
end)
