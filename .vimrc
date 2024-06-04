set nocompatible              " be iMproved, required
filetype off                  " required
scriptencoding utf-8
set encoding=utf-8

"execute pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'hdima/python-syntax'
Plugin 'nvie/vim-flake8'
Plugin 'Badacadabra/vim-archery'
Plugin 'cocopon/iceberg.vim'
Plugin 'zivyangll/git-blame.vim'
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"nerdtree
"autocmd vimenter * NERDTree
"aucolorscheme PaperColortocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeWinSize=25
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"Tagbar
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.java,*.py call tagbar#autoopen()
nmap <silent><F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 50

"powerline
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness
let g:Powerline_symbols = 'fancy'

"scheme
syntax enable
set background=dark
"let g:PaperColor_Theme_Options = {
"  \   'theme': {
"  \     'default.dark': {
"  \       'transparent_background': 0
"  \     }
"  \   }
"  \ }
"colorscheme PaperColor
colorscheme Iceberg
set termguicolors
set showtabline=2
set laststatus=2
"let g:molokai_original = 1
"let g:rehash256 = 1
" Airline
"let g:airline_theme='silver'
"let g:airline_theme = 'archery'

" Backspace deletes like most programs in insert mode
"set backspace=2
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
"set autoindent
"set shiftround

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Make it obvious where 80 characters is
"set textwidth=79
set colorcolumn=+1

" Numbers
set number
set numberwidth=4

set matchpairs+=<:>
set hlsearch

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" json格式化
map <F5> :%!python3 -m json.tool --no-ensure-ascii <CR>

" python3
let g:syntastic_python_checkers=['python3.8']
let python_highlight_all=1
syntax on

" copy
vmap <F8> "*y <CR>
map <F9> "*p <CR>

" pdb
let @p = 'oimport pdb;pdb.set_trace()??a'

" git blame
"nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
