" Vundle settings
"

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Plugins
"

Plugin 'gmarik/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/neocomplcache.vim'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'itchyny/lightline.vim'
"Plugin 'skammer/vim-css-color'
"Plugin 'othree/vim-autocomplpop'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'groenewege/vim-less'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'gregsexton/MatchTag'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'othree/html5.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'eparreno/vim-l9'
Plugin 'danro/rename.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'bling/vim-airline'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()

filetype plugin indent on


" SECTION: Functions {{{
"============================================================
function! NerdTreeToggle()
    if nerdtree#isTreeOpen()
        NERDTreeClose
    else
        NERDTree
    endif
endfunction

let g:isLeavedBufNerd = 0

function! NerdTreeCWD()
    if g:isLeavedBufNerd == 1
        let g:isLeavedBufNerd = 0
        return
    endif

    if nerdtree#isTreeOpen()
        NERDTreeCWD
        wincmd p 
    endif
endfunction

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" }}}

" SECTION: Misc {{{
"============================================================

filetype plugin on
syntax on
set colorcolumn=81

augroup Vimrc
    "Remove all autocommands
    autocmd!

    autocmd Filetype html,htmlphp,javascript,css,less setlocal ts=2 sts=2 sw=2
    autocmd Filetype vim,php setlocal ts=4 sts=4 sw=4

    autocmd BufEnter * if expand('%:p') !~ '://' | :cd %:p:h | endif | call NerdTreeCWD()
    autocmd BufLeave NERD_tree* let g:isLeavedBufNerd = 1 

    autocmd bufwritepost .vimrc source $MYVIMRC

    " NerdTree dirs color.
    "au FileType nerdtree hi Directory guifg=DarkGreen ctermfg=DarkGreen
augroup END

"autocmd BufEnter,FileType *
"\   if &ft ==# 'c' || &ft ==# 'cpp' | colorscheme darkblue |
"\   elseif &ft ==? 'javascript' | colorscheme distinguished |
"\   elseif &ft ==? 'css' | colorscheme molokai |
"\   else | colorscheme jellybeans |
"\   endif

"autocmd BufWinLeave *.html mkview
"autocmd BufWinEnter *.html silent loadview
set omnifunc=syntaxcomplete#Complete
set expandtab
set number
set foldcolumn=1
set smartindent
set wildmode=longest,list,full
set wildmenu
set nobackup
set nowritebackup
set hidden
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set ignorecase
set smartcase
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set title         " change the terminal's title
set showcmd       " e.g. to show number of chars in selection
colorscheme jellybeans

" change the mapleader from \ to ,
let mapleader = ","

" }}}


" Key mappings
"

" Insert one symbol and back to normal mode
nnoremap <Space> i <Esc>r
" Insert empty line above or below
nnoremap j o<Esc>k
nnoremap k O<Esc>j
" Nex/prev buffer
nnoremap K :bnext<CR>
nnoremap J :bprevious<CR>
" Quickly edit/reload the vimrc file
nnoremap <leader>v :e $MYVIMRC<CR>
noremap ; :
noremap \ ;
noremap - ,
nnoremap <silent> ,/ :nohlsearch<CR>
nnoremap <C-y>p i<?php<Space>echo<Space>;<Space>?><Esc>3hi
inoremap <C-y>p <?php<Space>echo<Space>;<Space>?><Esc>3hi
nnoremap <C-y>e i<?php<Space>;<Space>?><Esc>3hi
inoremap <C-y>e <?php<Space>;<Space>?><Esc>3hi
nnoremap w :bd<CR> 
nnoremap L J
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
nmap <leader>l :set list!<CR>
nnoremap <leader>t :e docs/todo<CR>


" NerdTree
"

let g:NERDTreeWinPos = "right"
" Toggle NerdTree with Ctrl-n
noremap <C-n> :call NerdTreeToggle()<CR>


" YouCompleteMe
"
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_semantic_triggers =  {
\   'c' : ['->', '.'],
\   'objc' : ['->', '.'],
\   'ocaml' : ['.', '#'],
\   'cpp,objcpp' : ['->', '.', '::'],
\   'perl' : ['->'],
\   'php' : ['->', '::'],
\   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
\   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : [':'],
\   'htmlphp' : ['<', 're!<[^>]+ '],
\   'less' : [': ', '!'],
\ }


" CtrlP
"

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_by_filename = 1


" Vim-airline
"

let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='jellybeans'


" Vim-lightline
"
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ 'component': {
      "\   'readonly': '%{&readonly?"":""}',
      "\ },
      "\ 'separator': { 'left': '', 'right': '' },
      "\ 'subseparator': { 'left': '', 'right': '' }
      "\ }


" Syntastic
"

" Html5 syntax checker
let g:syntastic_html_tidy_exec = '/usr/bin/tidy'
"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5


" NerdCommenter
"

let g:NERDCustomDelimiters = {
    \ 'htmlphp': { 'left': '/*', 'right': '*/', 'leftAlt': '<?php //', 'rightAlt': ' ?>' },
\ }


" Vim-fugitive
"

set diffopt+=vertical


" vim: set sw=4 sts=4 et fdm=marker:
