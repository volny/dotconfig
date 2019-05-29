" ==================================================
" BUFFER / WINDOW
" ==================================================

nnoremap <Leader>w <C-w>
" Toggle between last buffer

" Resize pane splits
" TODO - vim cant' map those - use iTerm magic instead
noremap <Up> <C-w>+
noremap <Down> <C-w>-
noremap <Left> <C-w>>
noremap <Right> <C-w><
" https://stackoverflow.com/questions/8033779/is-there-a-way-to-map-ctrl-period-and-ctrl-comma-in-vim
" nnoremap <C-.> <C-w>>
" nnoremap <C-,> <C-w><

nnoremap <Tab> :b#<CR>
" open a new empty buffer (replaces `:tabnew`)
nnoremap <Leader>bn :enew<CR>
" Close the current buffer and move to the previous one
" TODO if there's only one buffer I want to leave vim
nnoremap <Leader>x :bp<BAR>bd#<CR>
" nnoremap q :q<CR>
nnoremap <Leader>X :q!<CR>
nnoremap <Leader>Q :qall<CR>

" next and previous buffer
nnoremap H :bp<CR>
nnoremap L :bn<CR>

nnoremap <Leader><Tab> :Startify<CR>

" macros
noremap <C-q> q
noremap <C-w> @
" default macro register is `a` for quick access
noremap <C-a> qa
noremap <C-s> @a

" the 70s called
nnoremap Q <Nop>

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
" TODO - one day - [e also moves blocks, via tpope's unimpaired - apparently with g it keeps the selection or something
" probably needs to be loaded after unimpaired though
" vnoremap <C-k> [egv
" vnoremap <C-j> ]egv

nnoremap <Leader>p :set nopaste<CR>

" correct a word with the first spell suggestion
nnoremap <Leader>z z=1<CR>

" enter empty line above or below
nnoremap <CR> o<Esc>
nnoremap ,    O<Esc>
" move selection up or down
vnoremap ,    :<C-u>silent! '<,'>move-2<CR>gv=gv
vnoremap <CR> :<C-u>silent! '<,'>move'>+<CR>gv=gv
" vnoremap , [egv
" vnoremap <CR> ]egv

" move current line up or down
" nnoremap <C-CR> :<C-u>silent! move+<CR>==
" nnoremap <C,>   :<C-u>silent! move-2<CR>==

nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>h :split<CR>

" save buffers
nnoremap <Leader>s :w<CR>

" ==================================================
" SYNTAX
" ==================================================
nnoremap <Leader>fhtml :set ft=html<CR>
nnoremap <Leader>fjs :set ft=javascript<CR>
nnoremap <Leader>fjson :set ft=json<CR>
nnoremap <Leader>fmd :set ft=markdown<CR>
nnoremap <Leader>fpy :set ft=python<CR>
nnoremap <Leader>fsh :set ft=sh<CR>
nnoremap <Leader>fts :set ft=typescript<CR>
nnoremap <Leader>fvim :set ft=vim<CR>
nnoremap <Leader>fgql :set ft=graphql<CR>

