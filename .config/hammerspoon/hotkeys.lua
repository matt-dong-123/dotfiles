local hypr = { "ctrl", "alt", "cmd" }

local hotkeys = {
	a = "Zen",
	d = "Dorico 5",
	f = "Finder",
	l = "Logic Pro",
	m = "MuseScore 4",
	p = "Passwords",
	q = "QQMusic",
	s = "System Settings",
	t = "Tor Browser",
	w = "WeChat",
	z = "zoom.us",
	["return"] = "Wezterm",
}

-- Launch/Focus apps through hypr+the corresponding char in the hotkeys table
local function bind_hotkeys(mapping)
	for key, app in pairs(mapping) do
		hs.hotkey.bind(hypr, key, function()
			hs.application.launchOrFocus(app)
		end)
	end
end

bind_hotkeys(hotkeys)
