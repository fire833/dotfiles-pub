
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

-- require('plugins')
require('colors')
require('mappings')

-- Initial welcome print, sort of fun
print("Welcome to Kendall's Neovim!");

local set = vim.opt

-- Set relative line numbers.
set.relativenumber = true

-- Set line numbers with all files.
set.number = true

-- Disable swap file for buffers for now.
set.swapfile = false

-- Set colorscheme
set.termguicolors = true 

-- Disable wrapping
vim.opt.wrap = false

-- Enable mouse mode
vim.opt.mouse = 'a'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Some more configuration options for tabs/spacing.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable a smart indent of stuff.
vim.opt.smartindent = true

-- Set the scroll off option
vim.opt.scrolloff = 10

-- Searching stuff
vim.opt.hlsearch = false
vim.opt.incsearch = true
