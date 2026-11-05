
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

local function get_hostname()
    local name
 
    local f = io.open("/etc/hostname", "r")
    if f then
        name = f:read("*l")
        f:close()
    end
 
    if not name or name == "" then
        local p = io.popen("uname -n")
        if p then
            name = p:read("*l")
            p:close()
        end
    end
 
    return name and name:match("^%s*(.-)%s*$") or ""
end

local layouts = {
    ["ktlaptop"] = {
        { output = "eDP-1", mode = "1920x1080@60", position = "1920x0", scale = 1 },
        { output = "DP-2", mode = "1920x1080@60", position = "0x0", scale = 1 },
    },
    ["kttpc"] = {
        { output = "DP-1", mode = "1920x1080@144", position = "1920x0", scale = 1 },
        { output = "DP-2", mode = "1920x1080@144", position = "0x0", scale = 1 },
    },
    ["ktpc"] = {
        { output = "DP-1", mode = "1920x1080@144", position = "1920x0", scale = 1 },
        { output = "DP-2", mode = "1920x1080@144", position = "0x0", scale = 1 },
    },
}

local host = get_hostname()
local layout = layouts[host]
 
if layout then
    for _, m in ipairs(layout) do
        hl.monitor(m)
    end
end

-- fallback
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
