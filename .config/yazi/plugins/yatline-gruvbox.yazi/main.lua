--==============--
-- Gruvbox Dark --
--==============--

local gruvbox_dark_palette = {
	bg = "#282828",
	red = "#cc241d",
	green = "#98971a",
	yellow = "#d79921",
	blue = "#458588",
	purple = "#b16286",
	aqua = "#689d6a",
	gray0 = "#928374",
	light_red = "#fb4934",
	light_green = "#b8bb26",
	light_yellow = "#fabd2f",
	light_blue = "#83a598",
	light_purple = "#d3869b",
	light_aqua = "#8ec07c",
	fg = "#ebdbb2",
	bg0_h = "#1d2021",
	bg0 = "#282828",
	bg0_s = "#32302f",
	bg1 = "#3c3836",
	bg2 = "#504945",
	bg3 = "#665c54",
	bg4 = "#7c6f64",
	gray1 = "#7c6f64",
	gray2 = "#504945",
	fg4 = "#a89984",
	fg3 = "#bdae93",
	fg2 = "#d5c4a1",
	fg1 = "#ebdbb2",
	fg0 = "#fbf1c7",
	orange = "#d65d0e",
	light_orange = "#fe8019",
}

local gruvbox_dark_theme = {
	-- yatline
	section_separator_open = "",
	section_separator_close = "",

	inverse_separator_open = "",
	inverse_separator_close = "",

	part_separator_open = "",
	part_separator_close = "",

	style_a = {
		fg = gruvbox_dark_palette.bg0,
		bg_mode = {
			normal = gruvbox_dark_palette.gray0,
			select = gruvbox_dark_palette.light_blue,
			un_set = gruvbox_dark_palette.light_orange,
		},
	},
	style_b = { bg = gruvbox_dark_palette.bg2, fg = gruvbox_dark_palette.fg2 },
	style_c = { bg = gruvbox_dark_palette.bg1, fg = gruvbox_dark_palette.fg3 },

	permissions_t_fg = gruvbox_dark_palette.green,
	permissions_r_fg = gruvbox_dark_palette.yellow,
	permissions_w_fg = gruvbox_dark_palette.red,
	permissions_x_fg = gruvbox_dark_palette.aqua,
	permissions_s_fg = gruvbox_dark_palette.fg3,

	selected = { icon = "󰻭", fg = gruvbox_dark_palette.yellow },
	copied = { icon = "", fg = gruvbox_dark_palette.green },
	cut = { icon = "", fg = gruvbox_dark_palette.red },

	total = { icon = "󰮍", fg = gruvbox_dark_palette.yellow },
	succ = { icon = "", fg = gruvbox_dark_palette.green },
	fail = { icon = "", fg = gruvbox_dark_palette.red },
	found = { icon = "󰮕", fg = gruvbox_dark_palette.blue },
	processed = { icon = "󰐍", fg = gruvbox_dark_palette.green },

	-- yatline-githead
	prefix_color = gruvbox_dark_palette.fg3,
	branch_color = gruvbox_dark_palette.blue,
	commit_color = gruvbox_dark_palette.purple,
	behind_color = gruvbox_dark_palette.orange,
	ahead_color = gruvbox_dark_palette.aqua,
	stashes_color = gruvbox_dark_palette.purple,
	state_color = gruvbox_dark_palette.red,
	staged_color = gruvbox_dark_palette.yellow,
	unstaged_color = gruvbox_dark_palette.orange,
	untracked_color = gruvbox_dark_palette.aqua,
}

--===============--
-- Gruvbox Light --
--===============--

local gruvbox_light_palette = {
	bg = "#fbf1c7",
	red = "#cc241d",
	green = "#98971a",
	yellow = "#d79921",
	blue = "#458588",
	purple = "#b16286",
	aqua = "#689d6a",
	gray0 = "#928374",
	dark_red = "#9d0006",
	dark_green = "#79740e",
	dark_yellow = "#b57614",
	dark_blue = "#076678",
	dark_purple = "#8f3f71",
	dark_aqua = "#427b58",
	fg = "#3c3836",
	bg0_h = "#f9f5d7",
	bg0 = "#fbf1c7",
	bg0_s = "#f2e5bc",
	bg1 = "#ebdbb2",
	bg2 = "#d5c4a1",
	bg3 = "#bdae93",
	bg4 = "#a89984",
	gray1 = "#a89984",
	gray2 = "#665c54",
	fg4 = "#7c6f64",
	fg3 = "#665c54",
	fg2 = "#504945",
	fg1 = "#3c3836",
	fg0 = "#282828",
	orange = "#d65d0e",
	dark_orange = "#af3a03",
}

local gruvbox_light_theme = {
	-- yatline
	section_separator_open = "",
	section_separator_close = "",

	inverse_separator_open = "",
	inverse_separator_close = "",

	part_separator_open = "",
	part_separator_close = "",

	style_a = {
		fg = gruvbox_light_palette.bg0,
		bg_mode = {
			normal = gruvbox_light_palette.fg3,
			select = gruvbox_light_palette.dark_blue,
			un_set = gruvbox_light_palette.dark_red,
		},
	},
	style_b = { bg = gruvbox_light_palette.gray1, fg = gruvbox_light_palette.fg1 },
	style_c = { bg = gruvbox_light_palette.bg2, fg = gruvbox_light_palette.fg2 },

	permissions_t_fg = gruvbox_light_palette.dark_green,
	permissions_r_fg = gruvbox_light_palette.dark_yellow,
	permissions_w_fg = gruvbox_light_palette.dark_red,
	permissions_x_fg = gruvbox_light_palette.dark_aqua,
	permissions_s_fg = gruvbox_light_palette.fg2,

	selected = { icon = "󰻭", fg = gruvbox_light_palette.dark_yellow },
	copied = { icon = "", fg = gruvbox_light_palette.dark_green },
	cut = { icon = "", fg = gruvbox_light_palette.dark_red },

	total = { icon = "󰮍", fg = gruvbox_light_palette.dark_yellow },
	succ = { icon = "", fg = gruvbox_light_palette.dark_green },
	fail = { icon = "", fg = gruvbox_light_palette.dark_red },
	found = { icon = "󰮕", fg = gruvbox_light_palette.dark_blue },
	processed = { icon = "󰐍", fg = gruvbox_light_palette.dark_green },

	-- yatline-githead
	prefix_color = gruvbox_light_palette.fg2,
	branch_color = gruvbox_light_palette.dark_blue,
	commit_color = gruvbox_light_palette.dark_purple,
	behind_color = gruvbox_light_palette.dark_orange,
	ahead_color = gruvbox_light_palette.dark_aqua,
	stashes_color = gruvbox_light_palette.dark_purple,
	state_color = gruvbox_light_palette.dark_red,
	staged_color = gruvbox_light_palette.dark_yellow,
	unstaged_color = gruvbox_light_palette.dark_orange,
	untracked_color = gruvbox_light_palette.dark_aqua,
}

return {
	setup = function(_, args)
		return (args == "light" and gruvbox_light_theme) or gruvbox_dark_theme
	end,
}
