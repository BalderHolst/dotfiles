local o = vim.o
local bo = vim.bo
local wo = vim.wo

local cmd = vim.cmd



-- Global options
o.laststatus = 3 -- global status line
o.hlsearch = false -- ingen vedvarende highlight efter search
o.syntax = true -- enable syntax highlighting
o.mouse = "a" -- enable mouse
o.splitbelow = true
o.splitright = true
o.clipboard = "unnamedplus" -- use system clipboard
o.number = true -- enable numbering
o.smarttab = true

-- Buffer Options
-- bo.expandtab = true
bo.tabstop = 2
bo.shiftwidth = 2
bo.path = "**"

-- Window Options
wo.relativenumber = true
wo.wrap = false

-- Auto cmd
cmd('au InsertEnter * norm zz')
cmd('set path+=**')

-- vim.highlight.priorities.syntax = 250
vim.api.nvim_set_hl(0, 'test', {["fg"]="#ed6b25"})


-- Autocmds - find med :help event


-- Filetypes
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.dart" , command = "set filetype=dart" })



