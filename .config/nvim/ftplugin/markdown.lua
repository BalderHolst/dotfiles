local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd

local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- settings
wo.conceallevel = 2
wo.linebreak = true


-- mappings
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('n', '<leader>l', ':lua require("plugins.links").link_to()<cr>', opts)
map('n', '<leader>t', ':lua require("plugins.links").follow_link()<cr>', opts)


-- autocmd
cmd('au VimEnter * :Goyo')
