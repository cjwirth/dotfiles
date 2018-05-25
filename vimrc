set nocompatible              " be iMproved
filetype off                  " Vundle required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" Vundle required! 
Plugin 'VundleVim/Vundle.vim'
" My own bundles
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'keith/swift.vim'
Plugin 'scrooloose/NERDTree'
Plugin 'Valloric/YouCompleteMe'

" All plugins must be added befroe this is called
call vundle#end()
filetype plugin indent on " Vundle Required! but also nice

syntax on
colorscheme molokai

:set tabstop=4
:set shiftwidth=4
:set expandtab
:set number
:set ruler
:set laststatus=2
:set encoding=utf-8
:set fileencodings=utf-8

" Changes it so the current directory is the directory of the current file.
" i.e. `:e` can be used relative to the current file.
" :set autochdir

" Except yaml gets 2 spaces per tabs
autocmd FileType yaml,json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" In Vim 8, delete stopped working right
" I did't look too hard into why, but here:
" http://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
:set backspace=indent,eol,start

:set mouse=a
:set ttymouse=xterm2

" Adding support for tmux clipboard copying
" Yanking things will add them to the clipboard
:set clipboard=unnamed

