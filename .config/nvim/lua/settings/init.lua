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
bo.expandtab = true
bo.shiftwidth = 4
bo.tabstop = 4
bo.softtabstop = 4
-- bo.path = "**"

-- Window Options
wo.relativenumber = true
wo.wrap = false

-- Auto cmd
cmd('au InsertEnter * norm zz')
-- cmd('set path+=**')


-- Filetypes
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.dart" , command = "set filetype=dart" })



-- variables
vim.g.markdown_fenced_languages = {'python', 'cpp'} -- enable highlighting for these languages in markdown files.
vim.g.noswapfile = true -- disable swapfiles
