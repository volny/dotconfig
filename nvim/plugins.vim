call plug#begin('~/.config/nvim/plugged')

" code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" colorscheme
" Plug 'morhetz/gruvbox'
" Plug 'nanotech/jellybeans.vim'
" Plug 'whatyouhide/vim-gotham'
" Plug 'jacoborus/tender.vim'
" all the colorschemes - https://github.com/flazz/vim-colorschemes
Plug 'flazz/vim-colorschemes'


Plug 'reasonml-editor/vim-reason-plus'

" scribble
Plug 'wlangstroth/vim-racket', { 'for': 'scribble' }
Plug 'vim-scripts/scribble.vim', { 'for': 'scribble' }

" ctrl-c ctrl-c to 'send' line to repl
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
" NOTE
" run :Slimeconfig, select default
" the tmux pane number do <prefix>q

" alignment (for markdown tables etc) - https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" ga is reserved for easy align
xnoremap ga <Plug>(EasyAlign)
noremap ga <Plug>(EasyAlign)

" syntax
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

" "  don't use yajs, latest version is messed up (july 2018)
" Plug 'othree/yajs.vim', { 'for': 'javascript' }
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
" Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
" Plug 'neoclide/vim-jsx-improve', { 'for': 'javascript' }
" let g:vim_jsx_pretty_colorful_config = 1
" " Plug 'jelera/vim-javascript-syntax'
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
" Plug 'Quramy/vim-js-pretty-template', { 'for': 'javascript' }

Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'alexlafroscia/postcss-syntax.vim', { 'for': 'css' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" this is an unmaintained fork of vim-jsx-pretty - better options for tsx highlighing?
" Plug 'aanari/vim-tsx-pretty'

Plug 'posva/vim-vue/', { 'for': 'vue' }

Plug 'jparise/vim-graphql'

" TODO only for ts currently. Config for flow/js
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ 'for': ['typescript', 'javascript']
"     \ }
" nnoremap <Leader>l :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-markdown', { 'for': 'markdown' }
" " highlight markdown code blocks
let g:markdown_fenced_languages = ['bash=sh', 'css', 'html', 'javascript', 'json', 'lua', 'python', 'scss', 'sh', 'vim', 'zsh']
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 100

" tim pope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" needed for tmux-resurrect to (poorly) resurrect vim sessions
Plug 'tpope/vim-obsession'

Plug 'airblade/vim-gitgutter'
" leave the signcolumn styling alone
let g:gitgutter_override_sign_column_highlight = 0

Plug 'w0rp/ale'
" keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '➜'
" Set this. Airline will handle the rest.
" let g:airline#extensions#ale#enabled = 1
" NOTE some of these keybindings are overridden in ftplugin/js because we're using LanguageClient instead of Ale
" for some reason `nnoremap` doesn't work with these
nmap <silent> <Leader>an <Plug>(ale_next_wrap)
nmap <silent> <Leader>aN <Plug>(ale_previous_wrap)
nmap <silent> <Leader>af <Plug>(ale_fix)
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
nmap <silent> <Leader>aF ;call ToggleFix()<CR>
nmap <silent> <Leader>ad <Plug>(ale_go_to_definition)

let g:ale_fixers = {
      \  'javascript': ['prettier-eslint', 'prettier', 'eslint'],
      \  'css': ['prettier'],
      \  'graphql': ['prettier'],
      \  'html': ['prettier'],
      \  'json': ['prettier'],
      \  'less': ['prettier'],
      \  'markdown': ['prettier'],
      \  'scss': ['prettier'],
      \  'typescript': ['prettier'],
      \  'vue': ['prettier'],
      \  'python': ['black'],
\}

" try prettier-eslint first, as `prettier` ignores my eslintrc
let g:ale_linters = {
      \  'javascript': ['flow', 'prettier-eslint', 'prettier', 'eslint'],
      \  'python': ['flake8', 'bandit'],
\}
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
Plug 'epilande/vim-es2015-snippets', { 'for': 'javascript' }
Plug 'epilande/vim-react-snippets', { 'for': 'javascript' }

Plug 'christoomey/vim-tmux-navigator'

Plug 'ctrlpvim/ctrlp.vim'
nnoremap <Leader>j :CtrlP<CR>
" open buffers
nnoremap <Leader>k :CtrlPBuffer<CR>
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
" Plug 'Raimondi/delimitMate'

Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" make nerdcommenter work with vue
" https://github.com/posva/vim-vue
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction

function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" crap - lives in the command line or something - configuration nightmare
" Plug 'bling/vim-bufferline'

" ♥ this is the one 😘
Plug 'ap/vim-buftabline'

"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"" Enable the list of buffers in Airline
"let g:airline#extensions#tabline#enabled = 1
"" start counting buffers at 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"" only show bufferline if more than 1 open buffer
"" let g:airline#extensions#tabline#buffer_min_count = 2
"let airline#extensions#tabline#tabs_label = 0
"let airline#extensions#tabline#show_splits = 0
"let g:airline#extensions#tabline#show_close_button = 0
"" let g:airline#extensions#tabline#show_tab_nr = 0
"let g:airline#extensions#tabline#fnamecollapse = 1
"" let g:airline#extensions#tabline#show_tab_type = 0
"" let g:airline#extensions#tabline#buffers_label = ''
"" let g:airline#extensions#tabline#tabs_label = ''
"" " Just show the file name
"let g:airline#extensions#tabline#fnamemod = ':t'
"" show that little number in front
"" let g:airline#extensions#tabline#buffer_idx_mode = 1
"" don't show the buffer number (that :ls number)
"" let g:airline#extensions#tabline#buffer_nr_show = 0
"let g:airline#extensions#tabline#buffer_nr_show = 1
"" use the patched font
"" let g:airline_powerline_fonts = 1

"" let g:airline_exclude_filenames = ['NERD_tree_1'] " see source for current list
"
"  let g:airline_section_b = ''
"  let g:airline_section_y = ''
"  let g:airline_section_z = ''

" Plug 'Yggdroot/indentLine'
" let g:indentLine_char = '│'
" let g:indentLine_char = '┆'

" has issues -
" defaults to search word under cursor, but no way to pass `-w` flag; weird quickfix behaviour. switched back to homegrown script
" Plug 'jremmen/vim-ripgrep'
" nnoremap \ :Rg<SPACE>
" nnoremap K :Rg<CR>

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

" TODO use this instead of Nerdtree. Sadly ZERO documentation for now
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'https://github.com/Alok/notational-fzf-vim'
let g:nv_search_paths = ['~/Notes:Plaintext', '~/Notational']

Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

Plug 'scrooloose/nerdtree'
" toggle NerdTree with ctrl-n
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

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
    \ "Dirty"     : "↛",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '',
    \ "Unknown"   : ""
    \ }

" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-,>'

Plug 'ryanoasis/vim-devicons'
let g:WebDevIconsOS = 'Darwin'

let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" let g:webdevicons_enable_airline_tabline = 1
" let g:webdevicons_enable_airline_statusline = 1

let g:webdevicons_enable_ctrlp = 1


" for concealing nerdtree brackets
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

call plug#end()

" turn off ugly first line of nerdtree (must be outside the call)
augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end
