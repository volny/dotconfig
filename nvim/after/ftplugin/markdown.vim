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

