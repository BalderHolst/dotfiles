local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- tools = require("mappings.tools")


-- other
map('n', "<C-n>", ':noh<cr>', opts)

-- Spelling
map('n', '<leader>d', ':set spell! spelllang=da<CR>', opts)
map('n', '<leader>e', ':set spell! spelllang=En<CR>', opts)

-- Splits
map('n', '<c-l>', '<c-w>l', opts)
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)

-- Terminal
-- map('n', '<leader>t', ':vsp term://zsh<CR>', opts)
vim.keymap.set('n', '<leader>t', function() vim.fn.jobstart("kitty --detach") end) -- open terminal
map('t', '<Esc>', '<C-\\><C-n>', opts)


-- leaders
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.formatting_sync() print("formatted!") end)
map('n', '<leader>q', ':cclose<cr>', opts)

-- Packer
vim.keymap.set('n', '<leader>ps', function() require("packer").sync() end)

-- Telescope
local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_extensions = telescope.extensions
local telescope_themes = require("telescope.themes")

vim.keymap.set('n', 'ff', function() telescope_builtin.find_files() end) -- go to file
vim.keymap.set('n', 'fv', function() telescope_builtin.find_files({ cwd = "~/.config/nvim/" }) end) -- edit config
vim.keymap.set('n', 'fs', function() telescope_builtin.lsp_document_symbols() end) -- edit config
vim.keymap.set('n', 'fb', function() telescope_extensions.file_browser.file_browser() end) -- open file browser
vim.keymap.set('n', 'fp', function() telescope_extensions.projects.projects(telescope_themes.get_dropdown()) end) -- open list of projects in dropdown mode

-- luasnip
local luasnip = require("luasnip")
vim.keymap.set('i', '<M-l>', function()
    if luasnip.jumpable() then
        luasnip.jump()
    end
end)


-- Other Plugins
-- map('n', '<leader>f', ':Goyo | set linebreak <cr> | :e<cr>', opts)
vim.keymap.set('n', '<leader>z', function()
	vim.wo.wrap = not vim.wo.wrap
	require("zen-mode").toggle()
end)



