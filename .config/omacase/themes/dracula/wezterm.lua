local wezterm = require("wezterm")

local M = {}

M.apply_to_config = function(config)
	config.color_scheme = "Dracula (Official)"
	config.colors = {
		tab_bar = {
			background = "#282a36",
			active_tab = {
				bg_color = "#282a36",
				fg_color = "#bd93f9",
				intensity = "Bold",
				underline = "Single",
			},
			inactive_tab = {
				bg_color = "#282a36",
				fg_color = "#f8f8f2",
			},
		},
	}
	wezterm.on("update-right-status", function(window, _)
		local prefix = "  " .. wezterm.mux.get_active_workspace() .. " "
		if window:leader_is_active() then
			prefix = " 󰠠 " .. wezterm.mux.get_active_workspace() .. " "
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#ff5555" } },
				{ Text = prefix },
			}))
		else
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#50fa7b" } },
				{ Text = prefix },
			}))
		end
	end)
end

return M
