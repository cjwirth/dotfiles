set nocompatible              " be iMproved
filetype off                  " Vundle required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" Vundle required! 
Plugin 'gmarik/Vundle.vim'
" My own bundles
Plugin 'jnwhiteh/vim-golang'
Plugin 'kien/ctrlp.vim'
Plugin 'toyamarinyon/vim-swift'
Plugin 'scrooloose/NERDTree'

" All plugins must be added befroe this is called
call vundle#end()
filetype plugin indent on " Vundle Required! but also nice

syntax on

:set tabstop=4
:set shiftwidth=4
:set expandtab
:set number
:set ruler
:set laststatus=2
:set encoding=utf-8
:set fileencodings=utf-8

:set mouse=a
