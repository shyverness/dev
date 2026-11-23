set clipboard+=unnamedplus
set nu

set history=1000

set hlsearch
set incsearch

set cc=72,80,90,110

set list
let &listchars='tab:> ,trail:*,space:·,nbsp:⍽'

set scrolloff=10

set ignorecase

set ttimeout
set ttimeoutlen=25

colorscheme retrobox
set background=dark

nnoremap ! :!
vnoremap ! :!

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
