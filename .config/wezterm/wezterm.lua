local wezterm = require("wezterm")
local config = wezterm.config_builder()
config = {
	color_scheme = "Tokyo Night",
	font = wezterm.font_with_fallback({
		{ family = "Maple Mono NF CN", weight = "Bold" },
		"JetBrainsMono Nerd Font",
		"Consolas",
	}),
	enable_tab_bar = false,
	font_size = 20,
	window_decorations = "RESIZE",
	window_background_opacity = 0.75,
	macos_window_background_blur = 100,
	default_cursor_style = "BlinkingBar",
	cursor_blink_rate = 500,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	max_fps = 120,
	window_close_confirmation = "NeverPrompt",
}
return config
