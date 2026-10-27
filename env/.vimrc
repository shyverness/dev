let mapleader = " "

set clipboard=unnamedplus

let g:netrw_browse_split = 0
let g:netrw_banner = 1
let g:netrw_winsize = 25

set cmdheight=1
set guicursor=a:block-Cursor,i:ver30-iCursor,r-cr:hor20-Cursor
set wildignorecase
set encoding=utf-8
set fileencoding=utf-8
set switchbuf=usetab
set number

set tabstop=8
set shiftwidth=8
" set nosmartindent
set noexpandtab

set nowrap
let &showbreak = '\-'

set noswapfile
set nobackup

set hlsearch
set incsearch

set scrolloff=30
set isfname+=@-@
set signcolumn=no
set foldmethod=marker
set foldmarker={,}
set foldlevelstart=99
set cursorline
set colorcolumn=72,80,120,180
set textwidth=72

set list
let &listchars='tab:> ,trail:*,space:·,nbsp:⍽'

highlight default Nbsp guibg=#666666 guifg=#ffffff

set ignorecase
set smartcase
set nospell
set spelllang=en,fr,cjk

nnoremap <Enter> <Nop>
nnoremap <ESC> <Cmd>noh<CR>
nnoremap <leader>sa ggVG
nnoremap ! :!
vnoremap ! :!
nnoremap <leader>w <Cmd>write<CR>
nnoremap - 0
vnoremap - 0
xnoremap - 0
nnoremap ; :
vnoremap ; :
xnoremap ; :
nnoremap : ;
vnoremap : ;
xnoremap : ;
nnoremap j gj
vnoremap j gj
xnoremap j gj
nnoremap k gk
vnoremap k gk
xnoremap k gk
nnoremap R gR
vnoremap R gR
xnoremap R gR
nnoremap <leader>cz :center<CR>
vnoremap <leader>cz :center<CR>
xnoremap <leader>cz :center<CR>

