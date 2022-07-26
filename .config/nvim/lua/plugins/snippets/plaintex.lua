-- How to snippet: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

local testf = function(args, snip, user_arg) 
	print(args[1][1]) 
	return("hello")
end


return{
	-- Chapters and Sections
	-- s("ch", )


	-- Equations
	s("e", { t("$"), i(1, "eq"), t("$") }),		-- Inline equations
	s("ee", { t("$$"), i(1, "eq"), t("$$") }),	-- Display equations

	-- Operatiors
	s("*", { t("\\cdot "),  i(0)}),
	s("^", { t("^{"),  i(1), t("} "), i (0)}),
	s("frac", { t("\\frac{"), i(1), t("}{"), i(2), t("} "), i(0) }),

	s("test", {t("node 1: "), i(1), f(testf)},
		{1},
		{ user_args = { "userarg1", "user_arg2" }},
		),
}

