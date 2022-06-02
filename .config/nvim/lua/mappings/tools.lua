local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end


local M = {}

M.test = function()
	print("det virker!")
end

M.next_snip = function()
	if luasnip.expandable() then
		luasnip.expand()
	elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end

return M
