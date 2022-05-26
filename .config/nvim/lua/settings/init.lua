local o = vim.o
local bo = vim.bo
local wo = vim.wo

local cmd = vim.cmd



-- Global options
o.hlsearch = false
o.syntax = true
o.mouse = "a"
o.splitbelow = true
o.splitright = true
o.clipboard = "unnamedplus"
o.number = true

-- Buffer Options
bo.expandtab = true
bo.tabstop = 4
bo.shiftwidth = 4
bo.path = "**"

-- Window Options
wo.relativenumber = true

-- Auto cmd
cmd('au InsertEnter * norm zz')
