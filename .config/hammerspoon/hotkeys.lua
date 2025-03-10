-- Fuck you lsp
hs = hs

-- hyper key & meh key
local hypr = { "ctrl", "alt", "cmd", "shift" }
local meh = { "ctrl", "alt", "shift" }

-- Apps
local hotkeys = {
	a = "Zen",
	d = "Dorico 5",
	f = "Finder",
	l = "Logic Pro",
	m = "MuseScore 4",
	n = "Obsidian",
	o = "wpsoffice",
	p = "Passwords",
	q = "QQMusic",
	s = "System Settings",
	t = "Tor Browser",
	v = "VSCodium",
	w = "WeChat",
	y = "FreeTube",
	z = "zoom.us",
	["return"] = "Ghostty",
}

local function bind_hotkeys(mapping)
	for key, app in pairs(mapping) do
		hs.hotkey.bind(hypr, key, function()
			hs.application.launchOrFocus(app)
		end)
	end
	hs.hotkey.bind(meh, "return", function()
		hs.application.launchOrFocus("Emacs")
	end)
	hs.hotkey.bind("ctrl", "space", function()
		hs.application.launchOrFocus("Launchpad")
	end)
end

bind_hotkeys(hotkeys)
