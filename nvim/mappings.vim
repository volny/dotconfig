" ==================================================
" BUFFER / WINDOW
" ==================================================

nnoremap <Leader>w <C-w>
" Toggle between last buffer
nnoremap <Tab> :b#<CR>
" open a new empty buffer (replaces `:tabnew`)
nnoremap <Leader>bn :enew<CR>
" Close the current buffer and move to the previous one
" TODO if there's only one buffer I want to leave vim
nnoremap <Leader>x :bp<BAR>bd#<CR>
nnoremap q :q<CR>
nnoremap <Leader>Q :qall<CR>
" next and previous buffer
nnoremap H :bp<CR>
nnoremap L :bn<CR>

nnoremap <Leader><Tab> :Startify<CR>

" ==================================================
" CONVENIENCE
" ==================================================

" no need for shift to enter command
nnoremap ; :
vnoremap ; :
" but I still want to go to the next match on line
" disabled for now as it interferes with `:call` and is confuses new users
nnoremap : ;
vnoremap : ;

" repeat last command
nmap <Leader>. :<C-P><CR>
" indent lines with a single '<' or '>'
" this requires unbinding of unimpaired `>p` in `after/plugin`
nnoremap > >>_
nnoremap < <<_

inoremap jk <Esc>

" unmap annoying visual u to lowercase selection
vnoremap u hl

" quick syntax setting
nnoremap <Leader>sjs :set ft=javascript<CR>
nnoremap <Leader>smd :set ft=markdown<CR>
nnoremap <Leader>scss :set ft=css<CR>
nnoremap <Leader>svim :set ft=vim<CR>
nnoremap <Leader>sjson :set ft=json<CR>
nnoremap <Leader>spython :set ft=python<CR>
nnoremap <Leader>ssh :set ft=sh<CR>
nnoremap <Leader>sts :set ft=typescript<CR>

" save - W means w
command! W :w

" suspend with zz
noremap <silent> ZZ :suspend<CR>
" eol means the same in visual as in normal mode
vnoremap $ $h

