-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    -- Colorschemes
    use "EdenEast/nightfox.nvim" -- Colorscheme
    use "ellisonleao/gruvbox.nvim" -- Colorscheme

    -- Misc
    use 'machakann/vim-highlightedyank' -- Briefly highlight which text was yanked.
    use 'tpope/vim-commentary' -- comment out lines with gcc and gc
    use 'junegunn/goyo.vim' -- Center and hide tui
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

    -- Telescope
    use 'nvim-lua/plenary.nvim' -- Telescope dependency
    use 'nvim-telescope/telescope.nvim' -- main telescope
    use 'nvim-telescope/telescope-fzf-native.nvim' -- native fuzzy finder for telescope

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completion
    use "hrsh7th/cmp-nvim-lsp" -- LSP
    use "hrsh7th/cmp-nvim-lua" -- vim type in lua config

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer

end)

