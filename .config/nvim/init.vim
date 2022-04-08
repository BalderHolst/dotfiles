"/bin/bash: line 1: cho: command not found
call plug#begin('~/.vim/plugged')
" Parenthesis
" Plug 'yuttie/comfortable-motion.vim'

" Autopair
Plug 'jiangmiao/auto-pairs'

" Theme
Plug 'morhetz/gruvbox'

" File explorer
" Plug 'scrooloose/nerdtree'


" markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" latex AUTOCONPILE - https://yufanlu.net/2018/09/03/neovim-latex/
"Plug 'lervag/vimtex'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

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


" --------------------- COC --------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" brug [enter] til completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


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


"===================== AUTOCOMPILE ==================
autocmd BufNewFile,BufRead *.tex map å :w<CR>:!~/.scripts/clatex/clatex.sh<CR>
autocmd BufNewFile,BufRead *.py map å :w<CR>:!python %<CR>
autocmd BufNewFile,BufRead *.R map å :w<CR>:!Rscript %<CR>
autocmd BufNewFile,BufRead *.sh map å :w<CR>:!./%<CR>

"===================== latex ========================


autocmd BufNewFile,BufRead *.tex set filetype=tex
autocmd BufNewFile,BufRead *.tex set spell! spelllang=da



"===================== SPELLING ==================

" Spelling mistakes will also be colored red if you uncomment the colors.
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

map Æ :set spell! spelllang=da<CR>
map Ø :set spell! spelllang=En<CR>



"====================== Misc ======================

syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set path=**		    " setter hvor :e [file] søger

" No highlighted search
set nohlsearch


" Set the color scheme.
colorscheme gruvbox
set background=dark

"line numbers
set number
set relativenumber

" zz on insert
autocmd InsertEnter * norm zz

" indent
set smarttab

" Autoindent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Use tabs for python fils
autocmd BufNewFile,BufRead *.py imap <TAB> <C-v><TAB>

" Search and replace
map <leader>r :s/find/replace/g
