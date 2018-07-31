function! GetRunningOS()
  if has("win32")
return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction
let os=GetRunningOS()

" TODO replace this with (`which python`)
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'
" this is required for yarn install
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" ==================================================
" BUFFER / WINDOW
" ==================================================

nnoremap <Space>w <C-w>

" Toggle between last buffer
nnoremap <Tab> :b#<CR>

" open a new empty buffer (replaces `:tabnew`)
nnoremap <Space>bn :enew<CR>
" Close the current buffer and move to the previous one
" TODO if there's only one buffer I want to leave vim
nnoremap Q :bp<BAR>bd#<CR>
"nnoremap q :q<CR>
nnoremap <Space>qQ :qall<CR>

" next and previous buffer
nnoremap <Space>[ :bp<CR>
nnoremap <Space>] :bn<CR>

" a new buffer without filetype (:enew) is assumed to be markdown (disabled because of too many wrong positives)
" autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif
nnoremap <Space>md :set ft=markdown<CR>

" ==================================================
" PLUGINS
" ==================================================

call plug#begin('~/.config/nvim/plugged')

" code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" colorscheme
" Plug 'morhetz/gruvbox'
" Plug 'nanotech/jellybeans.vim'
" Plug 'whatyouhide/vim-gotham'
Plug 'jacoborus/tender.vim'

" syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" "  don't use yajs, latest version is messed up (july 2018)
" " Plug 'othree/yajs.vim'
" " Plug 'othree/es.next.syntax.vim'
" " Plug 'maxmellon/vim-jsx-pretty'
" " Plug 'neoclide/vim-jsx-improve'
" let g:vim_jsx_pretty_colorful_config = 1
" " Plug 'jelera/vim-javascript-syntax'
" " Plug 'othree/javascript-libraries-syntax.vim'
" " Plug 'Quramy/vim-js-pretty-template'

Plug 'moll/vim-node'
Plug 'hail2u/vim-css3-syntax'
Plug 'alexlafroscia/postcss-syntax.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'jparise/vim-graphql'
" this is an unmaintained fork of vim-jsx-pretty - better options for tsx highlighing?
" Plug 'aanari/vim-tsx-pretty'

" this is the official plugin, but I don't see what it actually does for me - it provides neither lsp nor syntax
" Plug 'flowtype/vim-flow'
" don't show quickfix
" let g:flow#showquickfix = 0
" dont' show quickfix if there's no errors
" let g:flow#autoclose = 1

Plug 'posva/vim-vue/', { 'for': 'vue' }

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" https://github.com/flowtype/flow-language-server
" requires `yarn global add flow-language-server` -> dockerize!
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['flow-language-server', '--stdio'],
    \ }

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-markdown'
" highlight markdown code blocks
let g:markdown_fenced_languages = ['bash=sh', 'css', 'html', 'javascript', 'json', 'lua', 'python', 'scss', 'sh', 'vim', 'zsh']

let g:markdown_syntax_conceal = 0

" tim pope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-obsession'

Plug 'airblade/vim-gitgutter'
" leave the signcolumn styling alone
let g:gitgutter_override_sign_column_highlight = 0

Plug 'w0rp/ale'
" keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '➜'
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" NOTE some of these keybindings are overridden in ftplugin/js because we're using LanguageClient instead of Ale
" for some reason `nnoremap` doesn't work with these
nmap <silent> <Space>an <Plug>(ale_next_wrap)
nmap <silent> <Space>aN <Plug>(ale_previous_wrap)
nmap <silent> <Space>af <Plug>(ale_fix)
" toggle ale_fix_on_save
function! ToggleFix()
  if g:ale_fix_on_save == 0
    let g:ale_fix_on_save = 1
    echom('Ale fix-on-save turned on')
  else
    let g:ale_fix_on_save = 0
    echom('Ale fix-on-save turned off')
  endif
endfunction
nmap <silent> <Space>aF ;call ToggleFix()<CR>
nmap <silent> <Space>ad <Plug>(ale_go_to_definition)

let g:ale_fixers = {
      \  'javascript': ['prettier-eslint', 'prettier', 'eslint'],
      \  'json': ['prettier'],
      \  'css': ['prettier'],
      \  'scss': ['prettier'],
      \  'less': ['prettier'],
      \  'typescript': ['prettier'],
      \  'graphql': ['prettier'],
      \  'markdown': ['prettier'],
\}

" try prettier-eslint first, as `prettier` ignores my eslintrc
let g:ale_linters = {'javascript': ['flow', 'prettier-eslint', 'prettier', 'eslint']}
let g:ale_completion_enabled = 1

let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'

" snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'

Plug 'christoomey/vim-tmux-navigator'

Plug 'ctrlpvim/ctrlp.vim'
nnoremap <Space>j :CtrlP<CR>
" open buffers
nnoremap <Space>f :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/](\.git|_site|dist|node_modules)$',
   \ 'file': '\v\.(exe|so|dll)$',
   \ 'link': 'some_bad_symbolic_links',
   \ }
" ctrl-p and ctrl-n should navigate ctrl-p entries, not the command history
let g:ctrlp_prompt_mappings = {
   \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>'],
   \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>'],
   \ 'PrtHistory(-1)':       ['<down>'],
   \ 'PrtHistory(1)':        ['<up>'],
   \ }

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

Plug 'bling/vim-airline'
" " Plug 'vim-airline/vim-airline-themes'
" " Enable the list of buffers in Airline
let g:airline#extensions#tabline#enabled = 1
" " start counting buffers at 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" " only show bufferline if more than 1 open buffer
" let g:airline#extensions#tabline#buffer_min_count = 2
let airline#extensions#tabline#tabs_label = 0
let airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1
" let g:airline#extensions#tabline#show_tab_type = 0
" let g:airline#extensions#tabline#buffers_label = ''
" let g:airline#extensions#tabline#tabs_label = ''
" " Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'
" " show that little number in front
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" " don't show the buffer number (that :ls number)
" let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
" " use the patched font
" let g:airline_powerline_fonts = 1

" Plug 'Yggdroot/indentLine'
" let g:indentLine_char = '│'
" let g:indentLine_char = '┆'

Plug 'ryanoasis/vim-devicons'
let g:WebDevIconsOS = 'Darwin'

let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

let g:webdevicons_enable_ctrlp = 1


" for concealing nerdtree brackets
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

Plug 'haya14busa/incsearch.vim'
" use incsearch.vim rather than built-in
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" clear highlight when I do anything other than n/N
let g:incsearch#auto_nohlsearch = 1
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

Plug 'mhinz/vim-startify'
" no asciiart header
let g:startify_custom_header = ['']
let g:startify_list_order = [
      \ ['        Most recently used files'],
      \ 'files',
      \ ['        Most recently used in current directory'],
      \ 'dir',
      \ ['        Sessions'],
      \ 'sessions',
      \ [        'Bookmarks'],
      \ 'bookmarks',
      \ ['        Commands'],
      \ 'commands',
      \ ]
" don't change vim's dir when I select a file
let g:startify_change_to_dir = 0

" Distraction-free toggle
Plug 'junegunn/goyo.vim'
" TODO I want limelight, but not for markdown
" Plug 'junegunn/limelight.vim'
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
" let g:limelight_conceal_guifg = '#757575'

nnoremap <Space>wd :Goyo<CR>

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" toggle NerdTree with ctrl-n
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = " " " <-- (just the right) invisible space
let g:NERDTreeDirArrowCollapsible= " " " <-- (just the right) invisible space
" no help string
let NERDTreeMinimalUI=1

Plug 'Xuyuanp/nerdtree-git-plugin'
" show ignored paths in nerdtree (-> should actually be greyed out)
" let g:NERDTreeShowIgnoredStatus = 1
" those symbols need a nerdfont to display (http://nerdfonts.com/?set=nf-oct-#cheat-sheet)

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✗",
    \ "Staged"    : "",
    \ "Untracked" : "六",
    \ "Renamed"   : "",
    \ "Unmerged"  : "",
    \ "Deleted"   : "",
    \ "Dirty"     : "➜",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '',
    \ "Unknown"   : ""
    \ }

" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" ==================================================
" COSMETICS
" ==================================================

" truecolor - only works on iterm2 > 3.0 & neovim >= 0.15
set termguicolors
set background=dark
" set background=light

" TODO colorscheme gruvbox
" colorscheme jellybeans
" colorscheme gotham
colorscheme tender
let g:airline_theme = 'tender'

"visual selection: reverse colors rather than change bg
hi Visual gui=reverse

" highlight current Line
" set cursorline
" highlight CursorLine guibg=#0d0d0d guifg=None

" nvim supports mode-dependent cursor shape built-in
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50

" set invisible chars = `:help listchars` to see options
set list lcs=tab:▸\ ,trail:·,nbsp:_

" use the *real* full-height vertical bar to make solid lines ✨
set fillchars+=vert:│
" use no separator (the empty space at EOL is significant, obviously)
" set fillchars+=vert:\

" ==================================================
" SETTINGS
" ==================================================

set timeoutlen=1000 ttimeoutlen=0

" Make tabs two spaces wide
set tabstop=2
set shiftwidth=2
" Indent using spaces
set expandtab

" Save backups here
set backupdir=$HOME/.config/nvim/backups
" Save swaps here
set directory=$HOME/.config/nvim/swaps
" Save undo history here
set undodir =$HOME/.config/nvim/undo
set undofile

" save session with timestamp
" autocmd VimEnter * execute "Obsession" . "~/.config/nvim/sessions/" . strftime('%Y%m%d%H%M%S') . ".vim"
" autocmd VimEnter * silent execute "Obsession" . "~/.config/nvim/sessions/"

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
nmap <Space>. :<C-P><CR>
" indent lines with a single '<' or '>'
" this requires unbinding of unimpaired `>p` in `after/plugin`
nnoremap > >>_
nnoremap < <<_

inoremap jk <Esc>

" save - W means w
command! W :w

" suspend with zz
noremap <silent> ZZ :suspend<CR>

" make all file-related tasks search down subfolders
set path+=**

" use mouse (trackpad) scrolling
set mouse=a

" when I switch to a terminal it should be ready to type (start in insert)
autocmd BufWinEnter,WinEnter term://* startinsert

" nvim - always use system clipboard (via pbcopy)
set clipboard+=unnamedplus

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" be case-insensitive unless I use uppercase
set smartcase

" allows buffers to be hidden
set hidden

" wrap lines
set wrap linebreak

" stop putting comments when 'newline' from commented line
"http://vim.wikia.com/wiki/Disable_automatic_comment_insertion

" Don't show me these files as I will never edit them
set wildignore=*.swp,*.bak,*.pyc,*.env,DS_Store,__pycache__,.vagrant/,*.egg,*.egg-info,*.zip

" Add the g flag to search/replace by default
set gdefault

"check for filechanges every 4 seconds
au CursorHold * checktime

" Enable line numbers
set number

" Use relative line numbers
set relativenumber
" ... but only when focused (broken)
" au FocusLost * set relativenumber&
" au FocusGained * set relativenumber

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Don't show the mode, as it's already in airline
set noshowmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling 2 lines before the horizontal window border
set scrolloff=2

" eol means the same in visual as in normal mode
vnoremap $ $h

" ==================================================
" FUNCTIONALITY
" ==================================================

" BETTER SEARCH FOR VIM

" https://robots.thoughtbot.com/faster-grepping-in-vim
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --path-to-ignore\ ~/.agignore
" Use ag in CtrlP for listing files
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" toggle quickfix and location lists with <Leader>q/l
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

" TODO unclear why I need `;call`, but everywhere else `:command` still works even after ;/: swapping
nmap <silent> <Leader>l ;call ToggleList("Location List", 'l')<CR>
nmap <silent> <Leader>q ;call ToggleList("Quickfix List", 'c')<CR>

" Json command to format and highlight

function! ThatFunc()
  %!python -m json.tool
  setlocal ft=json
  " TODO
  " want: gg=G
  " how to execute command over every line?
endfunction
command! Json call ThatFunc()
