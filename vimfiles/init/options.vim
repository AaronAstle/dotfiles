" General Setting Stored here

set shell=cmd
"set shell=bin\bash  "Might not play well with Windows Permissions
set shellcmdflag=/c

set backspace=indent,eol,start

" Standard Font and Size
set guifont=Consolas:h10
set encoding=utf8

" No audible bell
set vb

" Use console dialogs
set guioptions+=c
" No toolbar
set guioptions-=T
set guioptions-=m
set guioptions-=e
set guioptions-=rL
set guicursor=a:blinkon0        " Turn off the blinking cursor

"set pastetoggle keybinding
set pastetoggle=<F2>

set colorcolumn=80
set nowrap

set notimeout                   " No command timeout
set ttimeout                    " Add back a timeout for terminal vim
set ttimeoutlen=100             " Keep the timeout very short

set showcmd                     " Show typed command prefixes while waiting for operator
"set mouse=a                     " Use mouse support in XTerm/iTerm.

set showmatch
set expandtab
set tabstop=2
set autoindent
set smarttab
set shiftwidth=2
set rnu
set nu

set wildignore+=tags               " Ignore tags when globbing.
set wildignore+=tmp/**             " ...Also tmp files.
set wildignore+=public/uploads/**  " ...Also uploads.
set wildignore+=public/images/**   " ...Also images.
set wildignore+=vendor/**          " ...Also vendor.

set list                        " Show whitespace
set listchars=trail:·
set hidden

"New windows slit right or below
set splitright
set splitbelow

set wildmode=list:longest
set scrolloff=3

set laststatus=2

set incsearch
set hls
set smartcase
set autoread
set nospell

" Give me some History
set history=1024

" Swapfiles and Temps
set swapfile
"set directory=.,$TMP,$TEMP
"set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
"set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

"Save when doing various changing buffers or losing focus
set autowriteall
autocmd BufLeave,FocusLost * silent! wall  " Save anytime we leave a buffer or MacVim loses focus.
