set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'tomasr/molokai'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"nerdtree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
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
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

"syntastic
"let g:syntastic_check_on_open=1
"let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_wq = 0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Backspace deletes like most programs in insert mode
"set backspace=2
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5


filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
"set autoindent
"set shiftround

" Display extra whitespace
"set list listchars=tab:»·,trail:·

" Make it obvious where 80 characters is
"set textwidth=80
"set colorcolumn=+1

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
map <F5> :%!python3 -m json.tool <CR>
