local settings = require("settings")

local icons = {
	sf_symbols = {
		browser = "􀆪",
		terminal = "􀩼",
		music = "􀑪",
		social = "􀉫",
		calendar = "􀉉",
		clock = "􀐫",
		checkmark = "􀆅",
		package = "􀐚",
		work = "􁂥",
		plus = "􀅼",
		loading = "􀖇",
		apple = "􀣺",
		gear = "􀍟",
		cpu = "􀫥",
		clipboard = "􀉄",
		switch = {
			on = "􁏮",
			off = "􁏯",
		},
		volume = {
			_100 = "􀊩",
			_66 = "􀊧",
			_33 = "􀊥",
			_10 = "􀊡",
			_0 = "􀊣",
		},
		battery = {
			_100 = "􀛨",
			_75 = "􀺸",
			_50 = "􀺶",
			_25 = "􀛩",
			_0 = "􀛪",
			charging = "􀢋",
		},
		wifi = {
			upload = "􀄨",
			download = "􀄩",
			connected = "􀙇",
			disconnected = "􀙈",
			router = "􁓤",
		},
		media = {
			back = "􀊊",
			forward = "􀊌",
			play_pause = "􀊈",
		},
	},

	-- Alternative NerdFont icons
	nerdfont = {
		browser = "",
		terminal = "",
		music = "",
		social = "",
		work = "",
		plus = "",
		loading = "",
		apple = "",
		gear = "",
		cpu = "",
		clipboard = "",

		switch = {
			on = "󱨥",
			off = "󱨦",
		},
		volume = {
			_100 = "",
			_66 = "",
			_33 = "",
			_10 = "",
			_0 = "",
		},
		battery = {
			_100 = "",
			_75 = "",
			_50 = "",
			_25 = "",
			_0 = "",
			charging = "",
		},
		wifi = {
			upload = "",
			download = "",
			connected = "󰖩",
			disconnected = "󰖪",
			router = "󰑩",
		},
		media = {
			back = "",
			forward = "",
			play_pause = "",
		},
	},
}

if not (settings.icons == "NerdFont") then
	return icons.sf_symbols
else
	return icons.nerdfont
end
