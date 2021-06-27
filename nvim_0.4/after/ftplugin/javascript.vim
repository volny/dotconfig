setlocal formatoptions-=c formatoptions-=r formatoptions-=o
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" autozimu/LanguageClient-neovim
" for some reason `nnoremap` doesn't work here
" go to definition
nmap <Space>ad ;call LanguageClient_textDocument_definition()<CR>
" TODO set up the other stuff from https://github.com/autozimu/LanguageClient-neovim/issues/35#issuecomment-288731744
