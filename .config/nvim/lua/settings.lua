local o = vim.o
local bo = vim.bo
local wo = vim.wo

local cmd = vim.cmd



-- nvim options
vim.opt.undofile = true

-- Global options
vim.opt.laststatus = 3 -- global status line

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

-- o.syntax = true -- enable syntax highlighting

vim.opt.mouse = "a" -- enable mouse
vim.opt.splitbelow = true
vim.opt.splitright = true
-- vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.number = true -- enable numbering

vim.opt.smarttab = true

-- netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false

-- Auto cmd
cmd('au InsertEnter * norm zz')
-- cmd('set path+=**')


-- Filetypes
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.dart" , command = "set filetype=dart" })



vim.g.markdown_fenced_languages = {'python', 'cpp'} -- enable highlighting for these languages in markdown files.


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true



-- Extras 
local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})
local autocmd = vim.api.nvim_create_autocmd
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 70,
        })
    end,
})
