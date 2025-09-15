local wezterm = require("wezterm")

local M = {}

M.apply_to_config = function(config)
	config.color_scheme = "Everforest Dark Medium (Gogh)"
	config.colors = {
		tab_bar = {
			background = "#2d353b",
			active_tab = {
				bg_color = "#2d353b",
				fg_color = "#d699b6",
				intensity = "Bold",
				underline = "Single",
			},
			inactive_tab = {
				bg_color = "#2d353b",
				fg_color = "#d3c6aa",
			},
		},
	}
	wezterm.on("update-right-status", function(window, _)
		local prefix = "  " .. wezterm.mux.get_active_workspace() .. " "
		if window:leader_is_active() then
			prefix = " 󰠠 " .. wezterm.mux.get_active_workspace() .. " "
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#e67e80" } },
				{ Text = prefix },
			}))
		else
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#83c092" } },
				{ Text = prefix },
			}))
		end
	end)
end

return M
