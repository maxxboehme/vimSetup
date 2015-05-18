"========== General Settings ==========
set wildmenu

"============== Backspace =================
set nocompatible
set backspace=2
set nu
set cursorline
set list listchars=tab:»·,trail:-,extends:>,precedes:<,eol:¬

if has('gui_running')
   set lines=60 columns=140
endif

if has('gui_running')
   set guifont=Inconsolata\ for\ Powerline:h11
   let g:lightline = {
         \ 'colorscheme': 'wombat',
         \ 'active': {
         \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename'] ],
         \   'right': [ [ 'lineinfo', 'syntastic', 'trailingWhitespace', 'mytabs'], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
         \ },
         \ 'component_function': {
         \     'fugitive': 'MyFugitive',
         \     'readonly': 'MyReadonly',
         \     'modified': 'MyModified',
         \     'filename': 'MyFilename',
         \        'mode' : 'MyMode',
         \   'fileformat': 'MyFileformat',
         \     'filetype': 'MyFiletype',
         \ 'fileencoding': 'MyFileencoding',
         \ },
         \ 'component_expand': {
         \   'mytabs': 'MyTabs',
         \ 'trailingWhitespace' : 'MyTrailingWhitespace',
         \   'syntastic': 'SyntasticStatuslineFlag',
         \ },
         \ 'component_type': {
         \   'mytabs': 'warning',
         \  'trailingWhitespace' : 'error',
         \   'syntastic': 'error',
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
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' :
       \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyFileformat()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' :
        \ winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' :
        \ winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' :
        \ winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyTabs()
   let line = search('\t', 'n')
   if line != 0
      return 'Tabs:' . line
   else
      return ''
   endif
endfunction

function! MyTrailingWhitespace()
   let line = search('\s\+$', 'n')
   if line != 0
      return 'Trailing Whitespace:' . line
   else
      return ''
   endif
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_cpp_compiler_options = '-Wall'

augroup MyAutoErrorsWarnings
   autocmd!
   autocmd BufWritePost * call lightline#update()
augroup END

set guioptions-=L
