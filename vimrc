" ----------
" Vim Config - Aaron Astle
" ----------

set nocompatible
filetype off

set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/bundle/')

Plugin 'gmarik/Vundle.vim'

" Colorschemes
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/vim-tomorrow-theme'
"Plugin 'flazz/vim-colorschemes'

" Rails
"Plugin 'tpope/vim-rails'

" General Editing
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-unimpaired'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'camelcasemotion'
Plugin 'brysgo/quickfixfix'
Plugin 'easymotion/vim-easymotion'
Plugin 'regreplop.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'YankRing.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'mattn/emmet-vim'

" Window Management
Plugin 'ZoomWin'

" Searching
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-abolish'
Plugin 'ctrlpvim/ctrlp.vim'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

" Languages
Plugin 'sheerun/vim-polyglot'
Plugin 'genoma/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'ap/vim-css-color'
Plugin 'OrangeT/vim-csharp'

" Development Tool Integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-dispatch'
Plugin 'sjl/vitality.vim'

call vundle#end()

filetype plugin indent on
syntax enable
syntax on

"runtime! ..\..\vimfiles\init\**.vim

for f in split(glob('~/vimfiles/init/*.vim'), '\n')
  exe 'source' f
endfor

