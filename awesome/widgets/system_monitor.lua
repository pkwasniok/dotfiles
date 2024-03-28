local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local system_stats = {
    {
        name = "CPU",
    },
    {
        name = "MEMORY",
    },
    {
        name = "NETWORK",
    }
}

local system_monitor = { popup = nil, cpu_temperature = nil }

function system_monitor.setup()
    root_container = wibox.container.background()

    root_layout = wibox.layout.fixed.vertical()
    root_layout:set_spacing(5)

    text_title = wibox.widget.textbox()
    text_title:set_text("SYSTEM MONITOR")
    text_title:set_font("Rubik Bold 10")
    root_layout:add(text_title)


    -- CPU
    cpu_container = wibox.container.margin()
    cpu_container:set_margins(2)

    cpu_layout = wibox.layout.fixed.vertical()
    cpu_layout:set_spacing(2)

    temp = wibox.widget.textbox()
    temp:set_text("CPU")
    temp:set_font("Rubik Bold 8")
    cpu_layout:add(temp)

    temp = wibox.widget.textbox()
    temp:set_text("Temperature: N/A")
    cpu_layout:add(temp)
    system_monitor.cpu_temperature = temp

    cpu_container:set_widget(cpu_layout)
    root_layout:add(cpu_container)


    root_container:set_widget(root_layout)

    popup = awful.popup({
        visible = false,
        ontop = true,
        placement = awful.placement.top_left,
        widget = root_container,
    })

    system_monitor.popup = popup

    system_monitor.update()
end

function system_monitor.update()
    if system_monitor.popup.visible == false then
        return 0
    end

    -- Open file
    local file = io.open("/sys/class/thermal/thermal_zone10/temp")
    if not file then return false end

    -- Read temperature
    local data = file:read("a")
    local temperature = tonumber(data) / 1000

    -- Close file
    file:close()

    -- Update widget text
    system_monitor.cpu_temperature:set_text("Temperature: " .. tostring(temperature) .. "°C")
end

function system_monitor.show()
    system_monitor.popup.visible = true
    system_monitor.update()
end

function system_monitor.hide()
    system_monitor.popup.visible = false
end

function system_monitor.toggle()
    system_monitor.popup.visible = not system_monitor.popup.visible
    if system_monitor.popup.visible == true then
        system_monitor.update()
    end
end

return system_monitor

