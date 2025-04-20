require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

require("git"):setup()

local palette = {
	bg = "#1a1b26",
	bg_highlight = "#292e42",
	blue = "#7aa2f7",
	fg = "#c0caf5",
	green = "#9ece6a",
	purple = "#9d7cd8",
	red = "#f7768e",
	yellow = "#e0af68",
}

require("yatline"):setup({
	style_a = {
		fg = palette.blue,
		bg_mode = {
			normal = palette.bg,
			select = palette.bg,
			un_set = palette.bg,
		},
	},
	style_b = { bg = palette.bg, fg = palette.purple },
	style_c = { bg = palette.bg, fg = palette.red },

	-- Remove powerline separators
	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },

	header_line = {
		left = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
	},

	status_line = {
		left = {
			section_a = {
				{ type = "string", custom = false, name = "tab_mode" },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_size" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_path" },
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {
				{ type = "string", custom = false, name = "hovered_file_extension", params = { true } },
				{ type = "coloreds", custom = false, name = "permissions" },
			},
		},
	},
})
