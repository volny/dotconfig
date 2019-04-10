" remove background color
" highlight Normal guibg=None
" remove it from gitgutter too
highlight GitGutterAdd guibg=None
highlight GitGutterChange guibg=None
highlight GitGutterDelete guibg=None
highlight GitGutterChangeDelete guibg=None
" nicer symbol colors for Ale
highlight ALEErrorSign guifg=#ab4642 guibg=None |
highlight ALEWarningSign guifg=#f7ca88 guibg=None |
" no tilde for empty lines
highlight EndOfBuffer guibg=bg guifg=bg
" autocmd VimEnter * highlight EndOfBuffer guibg=None guifg=#282828

" nice line numbers and sign-column
highlight clear LineNr |
highlight clear SignColumn |
highlight LineNR guifg=#585858 guibg=None |
highlight CursorLineNR guifg=#f8f8f8 guibg=None |
" vertical split separator - None
highlight VertSplit guibg=None guifg=bg

" no ugly Error highlighting
" highlight Error NONE
" highlight ErrorMsg NONE
" highlight SpellBad NONE
" highlight SpellCap NONE
highlight SpellBad guibg=#303030
highlight SpellCap guibg=#303030

" ------------------------------------------------
" ------------------------------------------------

" TEMP COLORSCHEME CHANGE
" colorscheme afterglow
colorscheme anderson
highlight Normal guibg=#1f2c24

" TODO would be nice if bg changed on focus like tmux
" https://superuser.com/questions/385553/making-the-active-window-in-vim-more-obvious
" augroup NrHighlight
"   autocmd!
"   autocmd WinEnter * highlight Normal guibg=#333333
"   autocmd WinLeave * highlight Normal guibg=#1f2c24
" augroup END

highlight EndOfBuffer guifg=bg
highlight VertSplit guibg=None guifg=bg

highlight ColorColumn guifg=bg guibg=bg
