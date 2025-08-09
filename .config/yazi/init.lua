require("full-border"):setup()
require("git"):setup()
local tokyo_night_theme = require("yatline-tokyo-night"):setup("moon")
require("yatline"):setup({
	show_background = true,
	theme = tokyo_night_theme,
	header_line = {
		left = {
			section_a = {},
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
				{ type = "string", custom = false, name = "hovered_name" },
			},
			section_c = {
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "hovered_size" },
			},
			section_b = {},
			section_c = {
				{ type = "coloreds", custom = false, name = "permissions" },
			},
		},
	},
})
