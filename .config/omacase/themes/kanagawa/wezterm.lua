local wezterm = require("wezterm")

local M = {}

M.apply_to_config = function(config)
	config.color_scheme = "Kanagawa (Gogh)"
	config.colors = {
		tab_bar = {
			background = "#1f1f28",
			active_tab = {
				bg_color = "#1f1f28",
				fg_color = "#957fb8",
				intensity = "Bold",
				underline = "Single",
			},
			inactive_tab = {
				bg_color = "#1f1f28",
				fg_color = "#dcd7ba",
			},
		},
	}
	wezterm.on("update-right-status", function(window, _)
		local prefix = "  " .. wezterm.mux.get_active_workspace() .. " "
		if window:leader_is_active() then
			prefix = " 󰠠 " .. wezterm.mux.get_active_workspace() .. " "
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#ff5d62" } },
				{ Text = prefix },
			}))
		else
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#98bb6c" } },
				{ Text = prefix },
			}))
		end
	end)
end

return M
