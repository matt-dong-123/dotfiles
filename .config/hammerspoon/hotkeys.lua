local hypr = { "ctrl", "alt", "cmd", "shift" }

local hotkeys = {
	a = "Zen",
	d = "Dorico 5",
	f = "Finder",
	l = "Logic Pro",
	m = "MuseScore 4",
	n = "Obsidian",
	p = "Passwords",
	q = "QQMusic",
	s = "System Settings",
	t = "Tor Browser",
	v = "VSCodium",
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
