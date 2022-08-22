local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- tools = require("mappings.tools")


-- Spelling
map('n', '<leader>d', ':set spell! spelllang=da<CR>', opts)
map('n', '<leader>e', ':set spell! spelllang=En<CR>', opts)

-- Splits
map('n', '<c-l>', '<c-w>l', opts)
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)

-- leaders
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.formatting_sync() print("formatted!") end)
vim.keymap.set('n', '<leader>t', function() vim.fn.jobstart("kitty --detach") end) -- open terminal


local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_extensions = telescope.extensions
local telescope_themes = require("telescope.themes")

-- Packer
vim.keymap.set('n', '<leader>ps', function() require("packer").sync() end)

-- Telescope
vim.keymap.set('n', 'ff', function() telescope_builtin.find_files() end) -- go to file
vim.keymap.set('n', 'fv', function() telescope_builtin.find_files({ cwd = "~/.config/nvim/" }) end) -- edit config
vim.keymap.set('n', 'fs', function() telescope_builtin.lsp_document_symbols() end) -- edit config
vim.keymap.set('n', 'fb', function() telescope_extensions.file_browser.file_browser() end) -- open file browser
vim.keymap.set('n', 'fp', function() telescope_extensions.projects.projects(telescope_themes.get_dropdown()) end) -- open list of projects in dropdown mode


-- Other Plugins
-- map('n', '<leader>f', ':Goyo | set linebreak <cr> | :e<cr>', opts)

