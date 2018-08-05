Brightness Control for Awesome WM
=================================

This is a tiny Lua library to interface the [Awesome window manager][] with
[light][], a program that can control the backlight of your laptop screen
and keyboard.


Install
-------

First, you need to install [list][].

Second, in your awesome configuration directory:

```sh
    cd ~/.config/awesome/
    git clone git://github.com/troglobit/awesome-light.git light
```

In your `rc.lua`:

```lua
    local light = require("light")
    light.exec     = "light"          -- optional, set to abs path
    light.kbd      = ""               -- optional, default: thinkpad ctrl
    light.kbd_step = 1                -- optional, default: 1
    light.dpy_cap  = 2                -- optional, default: 2
    light.dpy_step = 10               -- optional, default: 10

    light.init()                      -- sets diplay min cap
```


Usage
-----

Done! Now you have these functions at your disposal:

* `light.dpy_inc()`
* `light.dpy_dec()`
* `light.kbd_toggle()`

They're pretty self-explanatory ... but here's an example for your
`rc.lua`:

```lua
-- Brightness
    globalkeys = gears.table.join(globalkeys,
	    awful.key({}, "XF86MonBrightnessUp",   function () light.dpy_inc() end),
	    awful.key({}, "XF86MonBrightnessDown", function () light.dpy_dec() end)
    )
    root.keys(globalkeys)
```

[Awesome window manager]: http://awesome.naquadah.org
[light]: http://jonls.dk/light/
