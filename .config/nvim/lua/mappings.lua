local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- tools = require("mappings.tools")


-- other
map('n', "<C-n>", ':noh<cr>', opts)

-- Spelling
map('n', '<leader>d', ':set spell! spelllang=da<CR>', opts)
map('n', '<leader>e', ':set spell! spelllang=En<CR>', opts)

-- Move highlighted lines
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Center cursor when scroling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Splits
map('n', '<c-l>', '<c-w>l', opts)
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)

-- Terminal
vim.keymap.set('n', '<leader>t', function() vim.fn.jobstart("kitty --detach") end) -- open terminal
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])


-- Quickfix
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
map('n', '<C-q>', ':cclose<cr>', opts)

-- leaders
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Packer
-- vim.keymap.set('n', '<leader>ps', function() require("packer").sync() end)

-- Telescope
local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_extensions = telescope.extensions
local telescope_themes = require("telescope.themes")

vim.keymap.set('n', 'ff', function() telescope_builtin.find_files() end) -- go to file
vim.keymap.set('n', 'fv', function() telescope_builtin.find_files({ cwd = "~/.config/nvim/" }) end) -- edit config
vim.keymap.set('n', 'fs', function() telescope_builtin.lsp_document_symbols() end) -- edit config
vim.keymap.set('n', 'fb', function() telescope_extensions.file_browser.file_browser() end) -- open file browser

-- luasnip
local luasnip = require("luasnip")
vim.keymap.set('i', '<M-l>', function()
    if luasnip.jumpable() then
        luasnip.jump()
    end
end)


-- Other Plugins
-- map('n', '<leader>f', ':Goyo | set linebreak <cr> | :e<cr>', opts)
