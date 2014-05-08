set nocompatible              " be iMproved
filetype off                  " Vundle required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" Vundle required! 
Bundle 'gmarik/Vundle.vim'
" My own bundles
Bundle 'jnwhiteh/vim-golang'

syntax on
filetype plugin indent on " Vundle Required! but also nice

:set tabstop=4
:set shiftwidth=4
:set expandtab

