--- Brightness Control for Awesome WM
-- Copyright (c) 2018  Joachim Nilsson <troglobit@gmail.com>
--
-- https://github.com/troglobit/awesome-light
--

-- standard libraries
local awful = require("awful")

-- variables
local light = {}
light.exec     = "light"                  -- Full path if not in $PATH
light.kbd      = "tpacpi::kbd_backlight"  -- From /sys/class/leds/
light.kbd_step = 1

light.dpy      = ""                       -- Autodetect
light.dpy_cap  = 2
light.dpy_step = 10

-- functions
function light.dpy_inc()
   awful.util.spawn(light.exec .. " -A " .. light.dpy_step)
end

function light.dpy_dec()
   awful.util.spawn(light.exec .. " -U " .. light.dpy_step)
end


function light.kbd_toggle()
   fp = io.popen(light.exec .. " -s " .. light.kbd .. " -k -r -G")
   if fp then
      if fp:read() == "0" then
	 val = light.kbd_step
      else
	 val = 0
      end
      fp:close()
   end
   awful.util.spawn(light.exec .. " -s " .. light.kbd .. " -k -r -S " .. val)
end

function light.kbd_dim()
   awful.util.spawn(light.exec .. " -s " .. light.kbd .. " -k -r -S 0")
end

function light.init()
   awful.util.spawn(light.exec .. " -c -S " .. light.dpy_cap)
end

return light
