setlocal formatoptions-=c formatoptions-=r formatoptions-=o
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" https://superuser.com/questions/747400/vim-remap-key-mapped-by-a-plugin

" needed because I want to indent lines with a single '<' or '>'
" unmap binding from vim-unimpaired (it's loaded later)
" still needs VimEnter for some reason
au VimEnter * nunmap >p
au VimEnter * nunmap >P
au VimEnter * nunmap <p
au VimEnter * nunmap <P
