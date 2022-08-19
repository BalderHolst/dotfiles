local telescope = require("telescope")
local fb_actions = require("telescope").extensions.file_browser.actions

local fb_confirm = function() vim.cmd('exe "normal \\<cr>"') end

local options = {
	defaults = {
		-- prompt_prefix = "  ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
	},

	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		file_browser = {
			theme = "ivy",
			hijack_netrw = true, -- disables netrw and use telescope-file-browser in its place
			hidden = true, -- show hidden files
			hide_parent_dir = true,
			mappings = {
				["i"] = { -- your custom insert mode mappings
					["<C-n>"] = fb_actions.create,
					["<C-e>"] = fb_actions.create_from_prompt,
					["<C-r>"] = fb_actions.rename,
					["<C-d>"] = fb_actions.remove,
					["<M-h>"] = fb_actions.goto_parent_dir,
					["<M-l>"] = fb_confirm,
					["<C-j>"] = function() fb_actions.move(1) end,
					-- ["<C-m>"] = fb_actions.move,
				},
				["n"] = {
					["d"] = fb_actions.remove,
					["l"] = fb_confirm,
					["h"] = fb_actions.goto_parent_dir,
				},
			},
		},
	}
}

-- setup with options
require('telescope').setup(options)

-- Extentions
telescope.load_extension('fzf')
telescope.load_extension('projects')
telescope.load_extension('file_browser')
-- telescope.load_extension('neuron')

