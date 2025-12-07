local icons = require 'icons'
local colors = require 'colors'
local settings = require 'settings'

-- Execute the event provider binary which provides the event "memory_update" for
-- the memory usage data, which is fired every 2.0 seconds.
sbar.exec 'killall memory_load >/dev/null; $CONFIG_DIR/helpers/event_providers/memory_load/bin/memory_load memory_update 2.0'

local memory = sbar.add('item', 'right.memory', 41, {
    position = 'right',
    icon = {
        string = icons.memory,
    },
    label = {
        string = '??%',
        font = {
            family = settings.font.numbers,
        },
        color = colors.default,
    },
    click_script = 'kitten quick-access-terminal --instance-group=monitor btop',
})

local function format_bytes(bytes)
    local units = { 'B', 'KB', 'MB', 'GB', 'TB' }
    local unit_index = 1
    local value = bytes

    while value >= 1024 and unit_index < #units do
        value = value / 1024
        unit_index = unit_index + 1
    end

    if unit_index == 1 then
        return string.format('%.0f%s', value, units[unit_index])
    else
        return string.format('%.1f%s', value, units[unit_index])
    end
end

memory:subscribe('memory_update', function(env)
    local used_percent = tonumber(env.used_percent)
    local used_bytes = tonumber(env.used_bytes)
    local total_bytes = tonumber(env.total_bytes)

    local color = colors.default
    if used_percent > 30 then
        if used_percent < 60 then
            color = colors.yellow
        elseif used_percent < 80 then
            color = colors.orange
        else
            color = colors.red
        end
    end

    local used_formatted = format_bytes(used_bytes)
    local total_formatted = format_bytes(total_bytes)

    -- Extract the numeric part from used_formatted and combine with total_formatted
    local used_value = string.match(used_formatted, '([%d%.]+)')
    local display_text = used_value .. '/' .. total_formatted

    memory:set {
        icon = { color = color },
        label = { string = display_text, color = color },
    }
end)
