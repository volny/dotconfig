" ==================================================
" OS dependent config
" ==================================================

" function! GetRunningOS()
"   if has("win32")
" return "win"
"   endif
"   if has("unix")
"     if system('uname')=~'Darwin'
"       return "mac"
"     else
"       return "linux"
"     endif
"   endif
" endfunction

" let hostOS = GetRunningOS()

" ==================================================
" format and highlight JSON, HTML, JS, CSS
" ==================================================

function! JSON() range
    if a:firstline == 1 && a:lastline == line('$')
        setlocal filetype=json
    endif
    " execute a:firstline . ',' . a:lastline . '!python -m json.tool'
    execute a:firstline . ',' . a:lastline . '!jq'
endfunction
command! -range=% Json <line1>,<line2>call JSON()

function! HTML() range
    if a:firstline == 1 && a:lastline == line('$')
        setlocal filetype=html
    endif
    execute a:firstline . ',' . a:lastline . '!js-beautify  -f - --type html'
endfunction
command! -range=% Html <line1>,<line2>call HTML()

function! JS() range
    if a:firstline == 1 && a:lastline == line('$')
        setlocal filetype=javascript
    endif
    execute a:firstline . ',' . a:lastline . '!js-beautify  -f - --type js'
endfunction
command! -range=% Js <line1>,<line2>call JS()

function! CSS() range
    if a:firstline == 1 && a:lastline == line('$')
        setlocal filetype=css
    endif
    execute a:firstline . ',' . a:lastline . '!js-beautify  -f - --type css'
endfunction
command! -range=% Css <line1>,<line2>call CSS()

" ==================================================
" toggle quickfix and location lists with <Leader>q/l
" ==================================================

" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <Leader>l ;call ToggleList("Location List", 'l')<CR>
nmap <silent> <Leader>q ;call ToggleList("Quickfix List", 'c')<CR>

" ==================================================
" Better search for vim
" ==================================================

" https://robots.thoughtbot.com/faster-grepping-in-vim

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --path-to-ignore\ ~/.agignore

" Use ag in CtrlP for listing files
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <Leader>/ :Ag<SPACE>

" ==================================================
" Save sessions with timestamp
" ==================================================

" autocmd VimEnter * execute "Obsession" . "~/.config/nvim/sessions/" . strftime('%Y%m%d%H%M%S') . ".vim"
" autocmd VimEnter * silent execute "Obsession" . "~/.config/nvim/sessions/"
