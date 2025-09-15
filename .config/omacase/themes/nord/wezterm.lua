local wezterm = require("wezterm")

local M = {}

M.apply_to_config = function(config)
	config.color_scheme = "Nord (Gogh)"
	config.colors = {
		tab_bar = {
			background = "#2e3440",
			active_tab = {
				bg_color = "#2e3440",
				fg_color = "#b48ead",
				intensity = "Bold",
				underline = "Single",
			},
			inactive_tab = {
				bg_color = "#2e3440",
				fg_color = "#eceff4",
			},
		},
	}
	wezterm.on("update-right-status", function(window, _)
		local prefix = "  " .. wezterm.mux.get_active_workspace() .. " "
		if window:leader_is_active() then
			prefix = " 󰠠 " .. wezterm.mux.get_active_workspace() .. " "
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#bf616a" } },
				{ Text = prefix },
			}))
		else
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#81a1c1" } },
				{ Text = prefix },
			}))
		end
	end)
end

return M
