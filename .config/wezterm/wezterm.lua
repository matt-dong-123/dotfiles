local wezterm = require("wezterm")
local config = wezterm.config_builder()
config = {
	color_scheme = "Tokyo Night",
	font = wezterm.font_with_fallback({ "Maple Mono NF CN", "JetBrainsMono Nerd Font", "Consolas" }),
	font_size = 20,
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	window_background_opacity = 0.75,
	macos_window_background_blur = 100,
	default_cursor_style = "BlinkingBar",
	cursor_blink_rate = 500,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	max_fps = 120,
}
return config
