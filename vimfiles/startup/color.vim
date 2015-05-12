" Color Settings
" color molokai
" color skittles_dark
" color monochrome
" color darth
" color wombat

if has('gui_running')
   set guioptions-=T
   color monochrome
else
   color slate
   hi CursorLine   cterm=NONE ctermbg=3 ctermfg=0
endif
