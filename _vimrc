set encoding=utf-8
scriptencoding utf-8

"Pathogen
call pathogen#infect()

"============== Filetype stuff ===========
filetype plugin on
filetype indent on

syntax on
set tabstop=3
set shiftwidth=3
set expandtab

"============== Script Configs ===========
source ~/vimfiles/startup/functions.vim
source ~/vimfiles/startup/mappings.vim
source ~/vimfiles/startup/color.vim
source ~/vimfiles/startup/settings.vim

set laststatus=2