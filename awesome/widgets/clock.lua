local wibox = require("wibox")

local clock = { widget = nil }

function clock.setup()
    clock.widget = wibox.widget.textbox()
    clock.widget.font = "Rubik Bold 8"
    clock.update()
end

function clock.update()
    local time = os.date("%H:%M")
    clock.widget.text = time
end

function clock.widget()
    return clock.widget
end

return clock

