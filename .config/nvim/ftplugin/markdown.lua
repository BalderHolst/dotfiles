local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd

local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- My Plugin
require("links")

-- settings
wo.conceallevel = 2
wo.linebreak = true


-- mappings
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('n', '<leader>l', ':lua require("links.functions").link_to()<cr>', opts)
map('n', '<leader>t', ':lua require("links.functions").follow_link()<cr>', opts)


-- autocmd
cmd('au VimEnter * :Goyo')
