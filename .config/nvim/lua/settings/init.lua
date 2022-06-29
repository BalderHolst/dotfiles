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
o.smarttab = true

-- Buffer Options
-- bo.expandtab = true
bo.tabstop = 1
bo.shiftwidth = 2
bo.path = "**"

-- Window Options
wo.relativenumber = true

-- Auto cmd
cmd('au InsertEnter * norm zz')
cmd('set path+=**')

-- vim.highlight.priorities.syntax = 250
vim.api.nvim_set_hl(0, 'test', {["fg"]="#ed6b25"})


