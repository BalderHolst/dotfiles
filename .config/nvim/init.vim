filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'machakann/vim-highlightedyank' " Briefly highlight which text was yanked.
Plug 'tpope/vim-commentary' " comment out lines with gcc and gc
Plug 'junegunn/goyo.vim' " center text
Plug 'tpope/vim-surround' " cs - change surround or ys(obj)(bracket)
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
call plug#end()

"definer learder til mellemrum
let mapleader=" "
"======================= Plugins ==================

map <F3> :NERDTreeToggle<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Goyo plugin makes text more readable when writing prose:
map <silent> <leader>f :Goyo \| set linebreak<CR>

" --------------------- COC --------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
			" \ pumvisible() ? "\<C-n>" :
			" \ <SID>check_back_space() ? "\<TAB>" :
			" \ coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"===================== AUTOCOMPILE ==================

autocmd BufNewFile,BufRead *.tex map å :w<CR>:!~/.scripts/clatex/clatex.sh<CR>
autocmd BufNewFile,BufRead *.R map å :w<CR>:!Rscript %<CR>
autocmd BufNewFile,BufRead *.sh map å :w<CR>:!./%<CR>
autocmd BufNewFile,BufRead *.fish map å :w<CR>:!./%<CR>

"===================== latex ========================

autocmd BufNewFile,BufRead *.tex set filetype=tex
autocmd BufNewFile,BufRead *.tex set spell! spelllang=da

"===================== SPELLING ==================

hi clear SpellBad
hi SpellBad cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline "ctermfg=203 guifg=#ff5f5f

"===================== MAPPINGS ==================

map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k

map <leader>d :set spell! spelllang=da<CR>
map <leader>e :set spell! spelllang=En<CR>

"====================== Misc ======================

syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set path=**		    " setter hvor :e [file] søger
set splitbelow splitright " Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set nohlsearch " No highlighted search
colorscheme gruvbox " colorscheme
set background=dark
set number
set relativenumber
autocmd InsertEnter * norm zz
set smarttab

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
