local wibox = require("wibox")

local battery_monitor = { widget = nil }

function battery_monitor.setup()
    battery_monitor.widget = wibox.widget.textbox("")
    battery_monitor.update()
end

function battery_monitor.update()
    -- Read battery capacity
    local file = io.open("/sys/class/power_supply/BAT0/capacity")
    if not file then return false end
    local battery_capacity = tonumber(file:read("a"))

    -- Read battery status
    file = io.open("/sys/class/power_supply/BAT0/status")
    if not file then return false end
    local battery_status = file:read("a")

    -- Close file
    file:close()

    -- Update widget text
    if string.find(battery_status, "Discharging") ~= nil then
        battery_monitor.widget.text = string.format("BAT(-): %d%%", battery_capacity)
    elseif string.find(battery_status, "Charging") then
        battery_monitor.widget.text = string.format("BAT(+): %d%%", battery_capacity)
    elseif string.find(battery_status, "Full") then
        battery_monitor.widget.text = ""
    end
end

return battery_monitor

