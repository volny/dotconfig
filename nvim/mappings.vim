" ==================================================
" BUFFER / WINDOW
" ==================================================

" macros
noremap <C-q> q
noremap <C-w> @
" default macro register is `a` for quick access
noremap <C-a> qa
noremap <C-s> @a

" the 70s called
nnoremap Q <Nop>

nnoremap <Leader>w <C-w>
" Toggle between last buffer
nnoremap <Tab> :b#<CR>
" open a new empty buffer (replaces `:tabnew`)
nnoremap <Leader>bn :enew<CR>
" Close the current buffer and move to the previous one
" TODO if there's only one buffer I want to leave vim
nnoremap <Leader>x :bp<BAR>bd#<CR>
nnoremap q :q<CR>
nnoremap <Leader>X :q!<CR>
nnoremap <Leader>Q :qall<CR>

" next and previous buffer
nnoremap H :bp<CR>
nnoremap L :bn<CR>

nnoremap <Leader><Tab> :Startify<CR>

" ==================================================
" CONVENIENCE
" ==================================================

" inoremap jk <Esc>

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

" unmap annoying visual u to lowercase selection
vnoremap u hl

" save - W means w
command! W :w

" shell quick access
noremap <silent> Z :suspend<CR>

" eol means the same in visual as in normal mode
vnoremap $ $h

" TODO (work in progress) move blocks around
" do :verbose <C-j> for find an appropriate shortcut
" also, ryan florance has some voodoo magic to move blocks (vip) around, which is exactly what this should be
" https://twitter.com/ryanflorence/status/1071267709453721600
" nnoremap <C-k> [e
" nnoremap <C-j> ]e
" vnoremap <C-k> [egv
" vnoremap <C-j> ]egv

nnoremap <Leader>p :set nopaste<CR>

" correct a word with the first spell suggestion
nnoremap <Leader>z z=1<CR>

" ==================================================
" SYNTAX
" ==================================================

nnoremap <Leader>scss :set ft=css<CR>
nnoremap <Leader>shtml :set ft=html<CR>
nnoremap <Leader>sjs :set ft=javascript<CR>
nnoremap <Leader>sjson :set ft=json<CR>
nnoremap <Leader>smd :set ft=markdown<CR>
nnoremap <Leader>spy :set ft=python<CR>
nnoremap <Leader>ssh :set ft=sh<CR>
nnoremap <Leader>sts :set ft=typescript<CR>
nnoremap <Leader>svim :set ft=vim<CR>
nnoremap <Leader>sgql :set ft=graphql<CR>

