set nocompatible              " be iMproved, required
filetype off                  " required

set number

set tabstop=4
set expandtab
set shiftwidth=2
set softtabstop=2

filetype plugin on
syntax on

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/hail2u/vim-css3-syntax'
Plug 'http://github.com/mattn/emmet-vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/othree/javascript-libraries-syntax.vim'
Plug 'https://github.com/elzr/vim-json'
Plug 'https://github.com/tingham/Venode'
Plug 'https://github.com/robu3/vimongous'
Plug 'https://github.com/nathanaelkane/vim-indent-guides'
Plug 'https://github.com/Valloric/YouCompleteMe'
call plug#end()

