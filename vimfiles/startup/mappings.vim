" Unmap the arrow keys
no <down>  ddp
no <up>    ddkP
no <left>  <Nop>
no <right> <Nop>
ino <down>  <Nop>
ino <up>    <Nop>
ino <left>  <Nop>
ino <right> <Nop>
vno <down>  <Nop>
vno <up>    <Nop>
vno <left>  <Nop>
vno <right> <Nop>

"============ Custom Mappings ========
" general mapping
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprevious<CR>
imap <C-Tab> :tabnext<CR>
imap <C-S-Tab> :tabprevious<CR>


" quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

"NERDTree"
map <C-n> :NERDTreeToggle<CR>

" Mappings to functions in functions.vim
nmap <leader>t :call Format_WhiteSpace_RemoveTrailing()<CR>
