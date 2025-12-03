local icons = require 'icons'
local colors = require 'colors'

local wifi = sbar.add('item', 'right.wifi', {
    position = 'right',
    icon = {
        color = colors.yellow,
        string = icons.wifi.disconnected,
    },
    label = {
        color = colors.yellow,
        string = 'Testing...',
    },
    update_freq = 1,
})

wifi:subscribe({ 'routine', 'system_woke' }, function()
    sbar.exec(
        "networksetup -listpreferredwirelessnetworks en0 | sed -n '2 p' | tr -d '\t'",
        function(out)
            local icon = icons.wifi.disconnected
            local label = 'Disconnected'
            local color = colors.red

            local name = out:gsub('%s+', '')
            if name ~= '' then
                icon = icons.wifi.connected
                label = name
                color = colors.default
            end

            wifi:set {
                icon = {
                    string = icon,
                    color = color,
                },
                label = {
                    string = label,
                    color = color,
                },
            }
        end
    )
end)
