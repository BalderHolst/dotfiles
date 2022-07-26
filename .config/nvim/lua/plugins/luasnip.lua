
-- load custom snippets (https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md)
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/lua/plugins/snippets"})

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

-- mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('i', '<M-l>', 'test!', { noremap = true, silent = true, callback = function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end })
