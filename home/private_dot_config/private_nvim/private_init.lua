
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

require("colors")
require("mappings")

-- Initial welcome print, sort of fun
print("Welcome to Kendall's Neovim!");

local opts = vim.opt

-- Set relative line numbers.
opts.relativenumber = true

-- Set line numbers with all files.
opts.number = true

-- Disable swap file for buffers for now.
opts.swapfile = false

-- Set colorscheme
opts.termguicolors = true 

-- Disable wrapping
opts.wrap = false

-- Enable mouse mode
opts.mouse = 'a'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Some more configuration options for tabs/spacing.
opts.tabstop = 4
opts.softtabstop = 4
opts.shiftwidth = 4
opts.expandtab = true

-- Enable a smart indent of stuff.
opts.smartindent = true

-- Set the scroll off option
opts.scrolloff = 10

-- Searching stuff
opts.hlsearch = false
opts.incsearch = true

require("lazyvim")
