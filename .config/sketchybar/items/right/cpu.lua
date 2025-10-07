local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Execute the event provider binary which provides the event "cpu_update" for
-- the cpu load data, which is fired every 2.0 seconds.
sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")

local cpu = sbar.add("item", "right.cpu", 42, {
	position = "right",
	icon = {
		string = icons.cpu,
	},
	label = {
		string = "??%",
		font = {
			family = settings.font.numbers,
		},
		color = colors.default,
	},
	padding_right = settings.paddings + 6,
	click_script = "kitten quick-access-terminal btop",
})

cpu:subscribe("cpu_update", function(env)
	-- Also available: env.user_load, env.sys_load
	local load = tonumber(env.total_load)
	cpu:push({ load / 100. })

	local color = colors.default
	if load > 30 then
		if load < 60 then
			color = colors.yellow
		elseif load < 80 then
			color = colors.orange
		else
			color = colors.red
		end
	end

	cpu:set({
		icon = { color = color },
		label = { string = env.total_load .. "%", color = color },
	})
end)
