setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set tabstop=2

" autozimu/LanguageClient-neovim
" for some reason `nnoremap` doesn't work here
" go to definition
nmap <Space>ad ;call LanguageClient_textDocument_definition()<CR>
" TODO set up the other stuff from https://github.com/autozimu/LanguageClient-neovim/issues/35#issuecomment-288731744
