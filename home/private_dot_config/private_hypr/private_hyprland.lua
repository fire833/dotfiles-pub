
-- Copyright (C) 2026 Kendall Tauser
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

-- See https://wiki.hypr.land/ for the full list of options.

-- Monitors configuration per host
require("monitors")

local main_font   = "rgb(D2C1B2)"
local backup_font = "rgb(AB936E)"
local dark_font   = "rgb(151A28)"
 
local background_1 = "rgb(151A26)"
local background_2 = "rgb(262F3E)"
local background_3 = "rgb(182132)"
 
local foreground_1 = "rgb(454240)"
local foreground_2 = "rgb(7A6B5B)"
local foreground_3 = "rgb(29201A)"
local foreground_4 = "rgb(B6A79B)"
 
local red    = "rgb(C52233)"
local green  = "rgb(003E1F)"
local blue   = "rgb(2B4360)"
local yellow = "rgb(EAE151)"
local aqua   = "rgb(6DD6DA)"

local browser = "brave"
local editor  = "vscodium"
local term    = "alacritty"

local mainMod  = "SUPER"
local shiftMod = "SUPER + SHIFT"

-- Startup
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper && hyprwall")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("waybar")
end)

-- Env
hl.env("XCURSOR_SIZE", "20")

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        touchpad = {
            natural_scroll = false,
        },

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    },

    general = {
        gaps_in     = 5,
        gaps_out    = 5,
        border_size = 2,
        col = {
            active_border = {
                colors = { foreground_2, foreground_4 },
                angle  = 90,
            },
            inactive_border = background_2,
        },

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 5,
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        -- pseudotile is no longer an option; use hl.dsp.window.pseudo() in a bind instead.
        preserve_split = true, -- you probably want this
    },

    cursor = {
        -- This fixes issues where in some apps the cursor disappears when still.
        no_hardware_cursors = true,
    },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "default" })

-- keybinds

-- Audio (binde -> repeating = true)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +2%"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -2%"), { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))

-- Main binds
hl.bind(mainMod  .. " + RETURN", hl.dsp.exec_cmd(term))
hl.bind(mainMod  .. " + C",      hl.dsp.exec_cmd(editor))
hl.bind(mainMod  .. " + B",      hl.dsp.exec_cmd(browser))
hl.bind(mainMod  .. " + T",      hl.dsp.exec_cmd("tor-browser"))
hl.bind(shiftMod .. " + S",      hl.dsp.exec_cmd("signal-desktop"))
hl.bind(shiftMod .. " + Q",      hl.dsp.window.close())                      -- was killactive
hl.bind(shiftMod .. " + E",      hl.dsp.exit())                              -- was exit
hl.bind(shiftMod .. " + V",      hl.dsp.window.float({ action = "toggle" })) -- was togglefloating
hl.bind(mainMod  .. " + L",      hl.dsp.exec_cmd("lockdown"))

-- Toggle fullscreen for focused window
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Move focus / shift focused window with arrow keys
for _, dir in ipairs({ "left", "right", "up", "down" }) do
    hl.bind(mainMod  .. " + " .. dir, hl.dsp.focus({ direction = dir }))
    hl.bind(shiftMod .. " + " .. dir, hl.dsp.window.move({ direction = dir }))
end

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- workspace 10 is on the 0 key
    hl.bind(mainMod  .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(shiftMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging (was bindm)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
