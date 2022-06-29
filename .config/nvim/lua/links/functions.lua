local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

-- our picker function: colors
M.link_to = function(opts)

    local find_command = (function()
        if opts then
            if opts.find_command then
                return opts.find_command
            end
        elseif 1 == vim.fn.executable "fd" then
            return { "fd", "--type", "f" }
        elseif 1 == vim.fn.executable "fdfind" then
            return { "fdfind", "--type", "f" }
        elseif 1 == vim.fn.executable "rg" then
            return { "rg", "--files" }
        elseif 1 == vim.fn.executable "find" and vim.fn.has "win32" == 0 then
            return { "find", ".", "-type", "f" }
        elseif 1 == vim.fn.executable "where" then
            return { "where", "/r", ".", "*" }
        end
    end)()

    function split (inputstr, sep)
        if sep == nil then
            sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
        end
        return t
    end

    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "Link to file",
        finder = finders.new_oneshot_job(find_command, opts),
        previewer = conf.file_previewer(opts),
        sorter = conf.file_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local split_path = split(selection[1], "/")
                vim.api.nvim_put({ "[[" .. split_path[#split_path]:gsub(".md$", "") .. "]]"}, "", false, true)
            end)
            return true
        end,
    }):find()
end


M.follow_link = function ()

	local get_link_under_cursor = function (line, pos)
		local matches = string.gmatch(line, '%[%[.-%]%]')
		for match in matches do
			local slut = string.find(line, match) + 2
			local start = slut - #match
			slut = slut - 1
			if start <= pos[2] and slut >= pos[2] then
				return(string.sub(match, 3, -3))
			end
		end
		return(nil)
	end

	local pos = vim.api.nvim_win_get_cursor(0)

	local linenr = pos[1]
	local curline = vim.api.nvim_buf_get_lines(
	0, linenr - 1, linenr, false)[1]


	local filename = get_link_under_cursor(curline, pos)

	-- print(filename)

	if filename == nil then
		print("Cursor not on link")
		return(false)
	end

	if not string.find(filename, "%.") then
		vim.cmd("find " .. filename .. ".md") -- TODO: This COULD throw an error...
	else
		vim.cmd("find " .. filename)
	end



	return(true)
end


return(M)

-- return require('telescope').register_extension({
--   exports = {
--     link = link_to(),
--   },
-- })
