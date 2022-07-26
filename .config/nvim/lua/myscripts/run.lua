local function setup_out()
	local code_win = vim.api.nvim_get_current_win()
	vim.cmd("vsplit") -- spilt vertically

	local out_win = vim.api.nvim_get_current_win()
	local out_buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_win_set_buf(out_win, out_buf) -- sets the content op the split to be the new buffer
	vim.api.nvim_win_set_width(out_win, 40) -- Sets the width
	vim.api.nvim_set_current_win(code_win) -- sætter curseren på coden igen

	return out_win, out_buf
end

local out_win, out_buf = nil, nil

function Run()

	if (not out_buf or not out_win) then
		out_win, out_buf = setup_out()
		print("1")
	elseif (not vim.api.nvim_buf_is_valid(out_buf) or not vim.api.nvim_win_is_valid(out_win)) then
		out_win, out_buf = setup_out()
		print("no out!")
		print("2")
	else
		print("out exists!")
	end


end

Run()
