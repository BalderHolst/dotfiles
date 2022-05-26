" Pluged Plugins
call plug#begin('~/.vim/plugged')
" Plug 'mzlogin/vim-markdown-toc'
"Plug 'preservim/vim-markdown'
call plug#end()

" Vundle Plugins
call vundle#begin()
"Plugin 'godlygeek/tabular'
"Plugin 'preservim/vim-markdown'
call vundle#end()

let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_folding_style_pythonic = 1
set conceallevel=2

map å :w<CR>:!md-pdf %<CR>

nmap j gj
nmap k gk


autocmd VimEnter * :Goyo | set linebreak

" obsidian links
nmap <leader>l :luafile ~/.config/nvim/obsidian-links.lua<CR>
