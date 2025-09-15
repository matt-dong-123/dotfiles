local wezterm = require("wezterm")

local M = {}

M.apply_to_config = function(config)
	config.color_scheme = "tokyonight_moon"
	config.colors = {
		tab_bar = {
			background = "#222436",
			active_tab = {
				bg_color = "#222436",
				fg_color = "#c099ff",
				intensity = "Bold",
				underline = "Single",
			},
			inactive_tab = {
				bg_color = "#222436",
				fg_color = "#c8d3f5",
			},
		},
	}
	wezterm.on("update-right-status", function(window, _)
		local prefix = "  " .. wezterm.mux.get_active_workspace() .. " "
		if window:leader_is_active() then
			prefix = " 󰠠 " .. wezterm.mux.get_active_workspace() .. " "
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#ff757f" } },
				{ Text = prefix },
			}))
		else
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#4fd6be" } },
				{ Text = prefix },
			}))
		end
	end)
end

return M
