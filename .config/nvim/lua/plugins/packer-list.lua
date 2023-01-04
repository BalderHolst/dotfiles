-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Packer can manage itself

	-- Dependencies
	use 'nvim-lua/plenary.nvim' -- Telescope and flutter-tools dependency

	-- Colorschemes
	use "EdenEast/nightfox.nvim" -- Colorscheme
	use "ellisonleao/gruvbox.nvim" -- gruvbox colorscheme
	use "bluz71/vim-moonfly-colors" -- moonfly colorscheme
	use "sainnhe/sonokai"
	use "folke/tokyonight.nvim"
	use { 'Everblush/everblush.nvim', as = 'everblush' }

	-- Misc
	use 'machakann/vim-highlightedyank' -- Briefly highlight which text was yanked.
	use 'tpope/vim-commentary' -- comment out lines with gcc and gc
	use 'junegunn/goyo.vim' -- Center and hide tui
	use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
	-- use "ahmedkhalf/project.nvim" -- roots nvim in git repos and keeps list of projects (integrates with telescope)
	use 'https://github.com/norcalli/nvim-colorizer.lua' -- preview colors
	use 'folke/zen-mode.nvim'
    use 'lewis6991/gitsigns.nvim' -- Git symbols
	-- use 'oberblastmeister/neuron.nvim'
	-- use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } } -- lua status line

	-- Telescope
	use 'nvim-telescope/telescope.nvim' -- main telescope
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- native fuzzy finder for telescope (better, faster, stronger!)
	use "nvim-telescope/telescope-file-browser.nvim"

	-- cmp plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	-- use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completion
	use "hrsh7th/cmp-nvim-lsp" -- LSP
	use "hrsh7th/cmp-nvim-lua" -- vim type in lua config

	-- More language Plugins
	use 'dart-lang/dart-vim-plugin' -- Dart
	use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' } -- Flutter
	use 'https://github.com/jubnzv/mdeval.nvim' -- markdown code blocks
	-- use 'thosakwe/vim-flutter' -- Flutter
	-- use { "vlelo/arduino-helper.nvim" } -- Arduino (requires arduino-cli)
	use "https://github.com/stevearc/vim-arduino"

	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "jose-elias-alvarez/null-ls.nvim" -- formatter and linter

	-- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/playground'
	use 'David-Kunz/markid'
    use 'nvim-treesitter/nvim-treesitter-context'

end)
