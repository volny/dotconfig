" automatic spellchecking for markdown files
setlocal spell

" autocmd VimEnter * silent execute "Goyo"
"function! s:auto_goyo()
"  if &ft == 'markdown'
"    Goyo 80
"  elseif exists('#goyo')
"    let bufnr = bufnr('%')
"    Goyo!
"    execute 'b '.bufnr
"  endif
"endfunction
"
"autocmd BufEnter * call s:auto_goyo()

" https://thoughtbot.com/blog/align-github-flavored-markdown-tables-in-vim
" https://github.com/junegunn/vim-easy-align
noremap <Leader><Bslash> :EasyAlign*<Bar><Enter>
