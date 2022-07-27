local M = {}


local function setup_out()
	local code_win = vim.api.nvim_get_current_win()
	vim.cmd("vsplit") -- spilt vertically

	local out_win = vim.api.nvim_get_current_win()
	local out_buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_win_set_buf(out_win, out_buf) -- sets the content op the split to be the new buffer
	-- vim.api.nvim_buf_set_name(out_buf, "output")
	vim.api.nvim_win_set_width(out_win, 40) -- Sets the width
	vim.api.nvim_set_current_win(code_win) -- sætter curseren på coden igen

	return out_win, out_buf
end

local out_win, out_buf = nil, nil

M.run_file = function(command)
	vim.api.nvim_buf_set_lines(out_buf, 0, -1, false, {"Python:"})
	vim.fn.jobstart(command, {
		stout_buffered = true,
		on_stdout = function (_, data)
			if data then
				vim.api.nvim_buf_set_lines(out_buf, -1, -1, false, data)
			end
		end,
		on_stderr = function (_, data)
			if data then
				vim.api.nvim_buf_set_lines(out_buf, -1, -1, false, data)
			end
		end
	})
end

M.start = function()

	if (not out_buf or not out_win) then
		out_win, out_buf = setup_out()
	elseif (not vim.api.nvim_buf_is_valid(out_buf) or not vim.api.nvim_win_is_valid(out_win)) then
		out_win, out_buf = setup_out()
	end


	local filename = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) -- name of current opended file

	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("runner", {clear = true}),
		pattern = "*.py",
		callback = function ()
			M.run_file({"python", filename})
		end
	})

end

M.close = function ()
	vim.api.nvim_buf_delete(out_buf, {}) -- deletes buffer (and its window)
	out_win, out_buf = nil, nil -- unsets saved buffer and window id

	vim.api.nvim_del_augroup_by_name("runner") -- deletes the auto commands
end

M.toggle = function()
	if (out_win and out_buf) then
		M.close()
	else
		M.start()
	end
end

return(M)
