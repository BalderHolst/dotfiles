-- How to snippet: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

print("hello from tex")

-- return {
-- 	parse("ctrig", "also loaded!!")
-- }, {
-- 	parse("autotrig", "autotriggered, if enabled")
-- }

return{
	s("e", {
		t("$$"), i(1, "eq"), t("$$")
	})
}

