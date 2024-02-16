local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

-- Features
-- Launching apps
-- Managing clients
-- Bluetooth
-- Wifi
-- Spotify

local portal = { popup = nil }

function portal.setup()
    portal.popup = awful.popup({
        placement = awful.placement.centered,
        ontop = true,
        visible = false,
        shape = gears.shape.rounded_rect,
        widget = {
            widget = wibox.container.margin,
            margins = 15,
            forced_width = 800,
            {
                {
                    widget = wibox.container.margin,
                    {
                        {
                            widget = wibox.widget.textbox,
                            text = "1  2  3  4  5  6  7  8",
                            font = "Rubik 10",
                            align = "left",
                        },
                        {
                            widget = wibox.widget.textbox,
                            text = "20:28",
                            font = "Rubik 12",
                            align = "center",
                        },
                        {
                            widget = wibox.widget.textbox,
                            text = "90%",
                            font = "Rubik 10",
                            align = "right",
                        },
                        layout = wibox.layout.flex.horizontal,
                    }
                },
                {
                    widget = wibox.container.background,
                    bg = "#374145",
                    shape = function(cr,w,h) gears.shape.rounded_rect(cr,w,h,5) end,
                    {
                        {
                            widget = wibox.container.margin,
                            margins = 10,
                            {
                                {
                                    widget = wibox.widget.textbox,
                                    text = "Spotify",
                                    font = "Rubik 10"
                                },
                                layout = wibox.layout.fixed.horizontal,
                            }
                        },
                        layout = wibox.layout.fixed.horizontal,
                    }
                },
                layout = wibox.layout.fixed.vertical,
                spacing = 15,
            }
        },
    })
end

function portal.open()
    portal.popup.visible = true
end

function portal.close()
    portal.popup.visible = false
end

function portal.toggle()
    if portal.popup.visible == false then
        portal.open()
    else
        portal.close()
    end
end

return portal
