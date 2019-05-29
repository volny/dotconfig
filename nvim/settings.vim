" ==================================================
" COSMETICS
" ==================================================

" truecolor - only works on iterm2 > 3.0 & neovim >= 0.15
set termguicolors
set background=dark
" set background=light

" colorscheme jellybeans
" colorscheme gotham
" colorscheme tender
" colorscheme tomorrow-night
let g:airline_theme='minimalist'

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

" Save backups here
set backupdir=$HOME/.config/nvim/backups
" Save swaps here
set directory=$HOME/.config/nvim/swaps
" Save undo history here
set undodir =$HOME/.config/nvim/undo
set undofile

" let g:python3_host_prog = '/usr/local/bin/python3'
" let g:python_host_prog = '/usr/local/bin/python'
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" ==================================================
" UI
" ==================================================

set timeoutlen=1000 ttimeoutlen=0

" Make tabs two spaces wide
set tabstop=2
set shiftwidth=2
" Indent using spaces
set expandtab

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
set scrolloff=0

" prisma files for written in graphql
autocmd BufRead,BufNewFile *.prisma set filetype=graphql

" racket - scribble
autocmd BufRead,BufNewFile *.scrbl  set filetype=scribble

" hide all statusline / status / statusbar / airline etc ⚔️
set noshowmode
set noruler
set laststatus=0
set noshowcmd

