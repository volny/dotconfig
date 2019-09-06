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
" autocmd VimEnter * highlight EndOfBuffer guibg=None guifg=#282828

" nice line numbers and sign-column
highlight clear LineNr |
highlight clear SignColumn |
" relative and current line number colors
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

" highlight Normal guibg=#262626

" TODO would be nice if bg changed on focus like tmux
" https://superuser.com/questions/385553/making-the-active-window-in-vim-more-obvious
" augroup NrHighlight
"   autocmd!
"   autocmd WinEnter * highlight Normal guibg=#333333
"   autocmd WinLeave * highlight Normal guibg=#1f2c24
" augroup END

" no tilde at EOF end of file
highlight EndOfBuffer guifg=bg
highlight VertSplit guibg=None guifg=bg

highlight ColorColumn guifg=bg guibg=bg

" hide top line (path) from nerdtree
augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end

" NOTE to change airline background color, swap these lines in ~/.config/nvim/plugged/oceanic-next/autoload/airline/themes/oceanicnext.vim
" might fork in the future, also to extend markdown and jsx tags, but not now
" let s:normal1   = [s:base10[0], s:base0C[0], s:base10[1], s:base0C[1]]
" let s:normal2   = [s:base07[0], s:base03[0], s:base07[1], s:base03[1]]
" let s:normal3   = [s:base07[0], s:base00[0], s:base07[1], s:base00[1]]
" let s:inactive1 = [s:base07[0], s:base03[0], s:base07[1], s:base03[1]]
" let s:inactive2 = [s:base07[0], s:base01[0], s:base07[1], s:base01[1]]
" let s:inactive3 = [s:base03[0], s:base00[0], s:base03[1], s:base00[1]]
" let s:insert1   = [s:base10[0], s:base0B[0], s:base10[1], s:base0B[1]]
" let s:insert2   = [s:base07[0], s:base03[0], s:base07[1], s:base03[1]]
" let s:insert3   = [s:base07[0], s:base00[0], s:base07[1], s:base00[1]]
" let s:replace1  = [s:base10[0], s:base08[0], s:base10[1], s:base08[1]]
" let s:replace2  = [s:base07[0], s:base03[0], s:base07[1], s:base03[1]]
" let s:replace3  = [s:base07[0], s:base00[0], s:base07[1], s:base00[1]]
" let s:visual1   = [s:base10[0], s:base09[0], s:base10[1], s:base09[1]]
" let s:visual2   = [s:base07[0], s:base03[0], s:base07[1], s:base03[1]]
" let s:visual3   = [s:base07[0], s:base00[0], s:base07[1], s:base00[1]]
" let s:ctrlp1    = [s:base10[0], s:base00[0], s:base10[1], s:base00[1]]
" let s:ctrlp2    = [s:base10[0], s:base03[0], s:base10[1], s:base03[1]]
" let s:ctrlp3    = [s:base10[0], s:base0D[0], s:base10[1], s:base0D[1]]
" let s:warning   = [s:base09[0], s:base01[0], s:base09[1], s:base01[1]]
" let s:error     = [s:base08[0], s:base01[0], s:base08[1], s:base01[1]]

