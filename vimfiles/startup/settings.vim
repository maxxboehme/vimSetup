"========== General Settings ==========
set wildmenu

"============== Backspace =================
set nocompatible
set backspace=2
set nu
set cursorline
set list listchars=tab:»·,trail:-,extends:>,precedes:<,eol:¬


" for Airline
" let g:airline_right_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_alt_sep= ''
" let g:airline_left_sep = ''

if has('gui_running')
   set guifont=Inconsolata\ for\ Powerline:h11
   let g:lightline = {
         \ 'colorscheme': 'wombat',
         \ 'active': {
         \   'left': [ [ 'mode', 'paste' ],
         \             [ 'fugitive', 'filename' ] ]
         \ },
         \ 'component_function': {
         \   'fugitive': 'MyFugitive',
         \   'readonly': 'MyReadonly',
         \   'modified': 'MyModified',
         \   'filename': 'MyFilename'
         \ },
         \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
         \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
         \ }
else
   let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
endif
function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "\ue0a2"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
