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
" Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'

" Color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'arzg/vim-corvine'

" All plugins must be added befroe this is called
call vundle#end()
filetype plugin indent on " Vundle Required! but also nice

"*** Color Schemes ***
" Uses terminal GUI colors (i think?)
" In general makes it look better, or more 'native' I guess?
:set termguicolors
syntax on
"** Corvine Light**
colorscheme corvine_light
"** Molokai **
" colorscheme molokai
"** Solarized**
" syntax enable
" set background=light "dark 
" colorscheme solarized

:set tabstop=4
:set shiftwidth=4
:set expandtab
:set number
:set ruler
:set laststatus=2
:set encoding=utf-8
:set fileencodings=utf-8

" Make whitespace characters visible
" :set list - to enable
" :set nolist - to disable again
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

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

" Remap C-e to nothing so to-end-of-line works
:imap <C-e> <Nop>
:nnoremap <C-t> :NERDTreeToggle<CR>

" Use ag for ctrlp as file finder instead of grep
" https://stackoverflow.com/a/17327372
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

