local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
	-- APPEARANCE
	color_scheme = "tokyonight_moon",
	font = wezterm.font_with_fallback({
		"Maple Mono NF CN",
		"JetBrainsMono Nerd Font",
		"Consolas",
	}),
	use_fancy_tab_bar = false,
	font_size = 20,
	window_background_opacity = 0.75,
	macos_window_background_blur = 100,
	default_cursor_style = "BlinkingBar",
	cursor_blink_rate = 500,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	window_padding = {
		left = 15,
		right = 15,
		top = 15,
		bottom = 0,
	},

	-- BEHAVIOR
	max_fps = 120,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE | MACOS_FORCE_ENABLE_SHADOW",
}

-- MUX (tmux keys)
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		mods = "LEADER",
		key = "b",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "%",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = '"',
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "CTRL",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "CTRL",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "CTRL",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "CTRL",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
}

for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

wezterm.on("update-right-status", function(window, _)
	local prefix = ""
	if window:leader_is_active() then
		prefix = " 󰠠 MUX "
	end
	window:set_left_status(wezterm.format({
		{ Background = { Color = "#f7768e" } },
		{ Foreground = { Color = "#222436" } },
		{ Text = prefix },
	}))
end)

return config
