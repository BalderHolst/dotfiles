local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

vim.g.mapleader = ' '



-- Spelling
map('n', '<leader>d', ':set spell! spelllang=da<CR>', opts)
map('n', '<leader>e', ':set spell! spelllang=En<CR>', opts)


-- Splits
map('n', '<c-l>', '<c-w>l', opts)
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)


-- Plugins
map('n', 'ff', ':Telescope find_files<cr>', opts)
map('n', '<leader>f', ':Goyo | set linebreak <cr>', opts)

