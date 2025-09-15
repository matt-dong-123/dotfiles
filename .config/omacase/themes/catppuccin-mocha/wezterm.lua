local wezterm = require("wezterm")

local M = {}

M.apply_to_config = function(config)
	config.color_scheme = "Catppuccin Mocha"
	config.colors = {
		tab_bar = {
			background = "#1e1e2e",
			active_tab = {
				bg_color = "#1e1e2e",
				fg_color = "#f5c2e7",
				intensity = "Bold",
				underline = "Single",
			},
			inactive_tab = {
				bg_color = "#1e1e2e",
				fg_color = "#f5e0dc",
			},
		},
	}
	wezterm.on("update-right-status", function(window, _)
		local prefix = "  " .. wezterm.mux.get_active_workspace() .. " "
		if window:leader_is_active() then
			prefix = " 󰠠 " .. wezterm.mux.get_active_workspace() .. " "
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#f38ba8" } },
				{ Text = prefix },
			}))
		else
			window:set_left_status(wezterm.format({
				{ Foreground = { Color = "#89b4fa" } },
				{ Text = prefix },
			}))
		end
	end)
end

return M
